/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import <XCTest/XCTest.h>
#import "CoreData+MagicalRecord.h"
#import "MXNAdapter.h"

#import "MXNRoot.h"
#import "MXNEntity_OneToOne.h"
#import "MXNEntity_OneToMany.h"
#import "MXNEntity_ManyToMany.h"

#import "NSManagedObject+MXNComparable.h"

@interface MaxsonTests : XCTestCase
@property (nonatomic, strong) MXNAdapter *adapter;
@end

@implementation MaxsonTests

- (void)setUp
{
    [super setUp];
    self.adapter = [[MXNAdapter alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [NSManagedObjectContext MR_resetDefaultContext];
    [super tearDown];
}

+ (void)setUp
{
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

+ (void)tearDown
{
    [MagicalRecord cleanUp];
}

- (id)exportImport:(NSManagedObject<MXNSerializable> *)managedObject
{
    NSDictionary *dictionary = [self.adapter dictionaryForManagedObject:managedObject];
    NSManagedObject *root = [self.adapter managedObjectsForDictionary:dictionary managedObjectContext:[NSManagedObjectContext MR_defaultContext]];
    return root;
}

- (void)testSingleObject
{
    MXNRoot *root = [MXNRoot MR_createEntity];
    root.mxn_boolValue = YES;
    root.mxn_data = [@"foo" dataUsingEncoding:NSUTF8StringEncoding];
    root.mxn_date = [NSDate date];
    root.mxn_decimal = [NSDecimalNumber maximumDecimalNumber];
    root.mxn_doubleValue = 123.456789;
    root.mxn_int16Value = INT16_MAX;
    root.mxn_int32Value = INT32_MAX;
    root.mxn_int64Value = INT64_MAX;
    root.mxn_string = @"bar";
    root.mxn_transformable = @"12";
    
    MXNRoot *newRoot = [self exportImport:root];
    
    XCTAssertTrue([root isEqualToManagedObjectByProperties:newRoot]);
}

- (void)testOneToOneRelationship
{
    MXNRoot *root = [MXNRoot MR_createEntity];
    MXNEntity_OneToOne *entity = [MXNEntity_OneToOne MR_createEntity];
    root.mxn_entity_oneToOne = entity;
    
    MXNRoot *newRoot = [self exportImport:root];
    
    MXNEntity_OneToOne *newEntity = newRoot.mxn_entity_oneToOne;
    XCTAssertTrue([newEntity.mxn_root isEqualToManagedObjectByObjectID:newRoot]);
}

- (void)testOneToManyRelationship
{
    MXNRoot *root = [MXNRoot MR_createEntity];
    int count = 3;
    for (int i = 0; i < count; i++) {
        MXNEntity_OneToMany *entity = [MXNEntity_OneToMany MR_createEntity];
        [root.mxn_entity_oneToManySet addObject:entity];
    }
    
    MXNRoot *newRoot = [self exportImport:root];
    
    XCTAssertEqual(root.mxn_entity_oneToMany.count, newRoot.mxn_entity_oneToMany.count);
    for (MXNEntity_OneToMany *newEntity in newRoot.mxn_entity_oneToMany) {
        XCTAssertTrue([newEntity.mxn_root isEqualToManagedObjectByObjectID:newRoot]);
    }
}

- (void)testManyToManyRelationship
{
    MXNRoot *root1 = [MXNRoot MR_createEntity];
    MXNRoot *root2 = [MXNRoot MR_createEntity];
    MXNRoot *root3 = [MXNRoot MR_createEntity];
    root1.mxn_int16Value = 1;
    root2.mxn_int16Value = 2;
    root3.mxn_int16Value = 3;

    MXNEntity_ManyToMany *entity1 = [MXNEntity_ManyToMany MR_createEntity];
    MXNEntity_ManyToMany *entity2 = [MXNEntity_ManyToMany MR_createEntity];
    
    entity1.mxn_int16Value = 1;
    entity2.mxn_int16Value = 2;
    
    [root1.mxn_entity_manyToManySet addObject:entity1]; // R1 <-> E1
    [root1.mxn_entity_manyToManySet addObject:entity2]; // R2 <-> E2
    [root2.mxn_entity_manyToManySet addObject:entity1]; // R2 <-> E1
    [root3.mxn_entity_manyToManySet addObject:entity2]; // R3 <-> E2
    
    MXNRoot *newRoot1 = [self exportImport:root1];
    
    MXNEntity_ManyToMany *newEntity1, *newEntity2;
    for (MXNEntity_ManyToMany *entity in newRoot1.mxn_entity_manyToMany) {
        if (entity.mxn_int16Value == 1) {
            newEntity1 = entity;
        } else if (entity.mxn_int16Value == 2) {
            newEntity2 = entity;
        }
    }
    
    MXNRoot *newRoot2, *newRoot3;
    for (MXNRoot *root in newEntity1.mxn_roots) {
        if (root.mxn_int16Value == 2) {
            newRoot2 = root;
        }
    }
    for (MXNRoot *root in newEntity2.mxn_roots) {
        if (root.mxn_int16Value == 3) {
            newRoot3 = root;
        }
    }
    
    XCTAssertNotNil(newEntity1);
    XCTAssertNotNil(newEntity2);
    XCTAssertNotNil(newRoot2);
    XCTAssertNotNil(newRoot3);
    XCTAssertEqual(newRoot1.mxn_entity_manyToMany.count, 2);
    XCTAssertEqual(newRoot2.mxn_entity_manyToMany.count, 1);
    XCTAssertEqual(newRoot3.mxn_entity_manyToMany.count, 1);
    XCTAssertEqual(newEntity1.mxn_roots.count, 2);
    XCTAssertEqual(newEntity2.mxn_roots.count, 2);
    
}


@end
