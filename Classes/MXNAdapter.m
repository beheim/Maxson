/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "MXNAdapter.h"
#import "Nilus.h"

@interface MXNAdapter()
@property (nonatomic, copy) NSString *OBJ_ID_KEY, *OBJ_REF_KEY;
// object -> dict
@property (nonatomic, strong) NSMutableSet *ids;
@property (nonatomic, strong) NSMutableDictionary *rootDictionary;
@property (nonatomic, strong) NSMutableArray *mutableVisitedDuringExport,
                                             *mutableVisitedDuringImport;

// dict -> object
@property (nonatomic, strong) NSMutableDictionary *objectsDictionary;
@end

@implementation MXNAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.OBJ_ID_KEY = @"$id";
        self.OBJ_REF_KEY = @"$ref";
    }
    return self;
}

- (instancetype)initWithObjIdKey:(NSString *)objIdKey objRefKey:(NSString *)objRefKey
{
    self = [super init];
    if (self) {
        self.OBJ_ID_KEY = objIdKey;
        self.OBJ_REF_KEY = objRefKey;
    }
    return self;
}

- (NSDictionary *)dictionaryForManagedObject:(NSManagedObject<MXNSerializable> *)object
{
    self.ids = [NSMutableSet set];
    self.rootDictionary = [NSMutableDictionary dictionary];
    self.mutableVisitedDuringExport = [NSMutableArray array];
    
    [self dictionaryForObject:object currentDictionary:self.rootDictionary];
    return [self.rootDictionary copy];
}

- (void)dictionaryForObject:(NSManagedObject<MXNSerializable> *)object currentDictionary:(NSMutableDictionary *)currentDictionary
{
    // Get object id
    NSString *fullObjectID = [object.objectID.URIRepresentation absoluteString];
    NSString *objectIDLastPathComponent = [fullObjectID lastPathComponent];
    NSString *objectIDSecondLastPathComponent = [[fullObjectID stringByDeletingLastPathComponent] lastPathComponent];
    NSString *objectID = [NSString stringWithFormat:@"%@/%@", objectIDSecondLastPathComponent, objectIDLastPathComponent];
    
    if ([object respondsToSelector:@selector(mxn_visitDuringExport)]) {
        [self.mutableVisitedDuringExport addObjectNil:[object mxn_visitDuringExport]];
    }
    
    // Check whether it is new
    if (![self.ids containsObject:objectID]) {
        // It is new, track the object id
        [self.ids addObject:objectID];
        [currentDictionary setObject:objectID forKey:self.OBJ_ID_KEY];
        
        // Serialize the attributes
        NSArray *serializableAttributeNames = [object mxn_serializableAttributeNames];
        for (NSString *attributeName in serializableAttributeNames) {
            [currentDictionary setObjectNil:[object valueForKeyPath:attributeName] forKey:attributeName];
        }
        
        // Serialize the relationships
        NSArray *serializableRelationshipNames = [object mxn_serializableRelationshipNames];
        NSDictionary *relationshipDescriptions = [[object entity] relationshipsByName];
        for (NSString *relationshipName in serializableRelationshipNames) {
            NSRelationshipDescription *relationshipDescription = relationshipDescriptions[relationshipName];
            if (relationshipDescription.maxCount != 1) {
                // 1:n
                NSMutableArray *relationships = [NSMutableArray array];
                [currentDictionary setObject:relationships forKey:relationshipName];
                NSSet *referencedObjects = [object valueForKey:relationshipName];
                for (NSManagedObject<MXNSerializable> *referencedObject in referencedObjects) {
                    NSMutableDictionary *referencedObjectDictionary = [NSMutableDictionary dictionary];
                    [relationships addObject:referencedObjectDictionary];
                    [self dictionaryForObject:referencedObject currentDictionary:referencedObjectDictionary];
                }
            } else {
                // 1:1
                NSManagedObject<MXNSerializable> *referencedObject = [object valueForKey:relationshipName];
                if (referencedObject != nil) {
                    NSMutableDictionary *referencedObjectDictionary = [NSMutableDictionary dictionary];
                    [currentDictionary setObject:referencedObjectDictionary forKey:relationshipName];
                    [self dictionaryForObject:referencedObject currentDictionary:referencedObjectDictionary];
                }
            }
        }
    } else {
        // Object ID is already used, so use a reference
        [currentDictionary setObject:objectID forKey:self.OBJ_REF_KEY];
    }
}

- (NSArray *)visitedDuringExport
{
    return [self.mutableVisitedDuringExport copy];
}

- (NSManagedObject *)managedObjectsForDictionary:(NSDictionary *)dictionary managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    self.objectsDictionary = [NSMutableDictionary dictionary];
    self.mutableVisitedDuringImport = [NSMutableArray array];
    return [self createManagedObjectsForCurrentDictionary:dictionary managedObjectContext:managedObjectContext];
}

- (NSManagedObject *)createManagedObjectsForCurrentDictionary:(NSDictionary *)currentDictionary managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    NSString *objectID = [currentDictionary valueForKey:self.OBJ_ID_KEY];
    NSManagedObject<MXNSerializable> *newEntity;
    if (objectID != nil) {
        NSString *entityName = [objectID pathComponents][0];
        newEntity = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:managedObjectContext];
        [self.objectsDictionary setObject:newEntity forKey:objectID];
    } else {
        NSString *ref = [currentDictionary objectForKey:self.OBJ_REF_KEY];
        newEntity = self.objectsDictionary[ref];
    }
    for (NSString *attributeName in currentDictionary) {
        if (![attributeName isEqualToString:self.OBJ_ID_KEY]) {
            id value = [currentDictionary objectForKey:attributeName];
            if ([value isKindOfClass:[NSDictionary class]]) {
                NSString *ref = [value objectForKey:self.OBJ_REF_KEY];
                if (ref == nil) {
                    // Not a reference.
                    [self createManagedObjectsForCurrentDictionary:value managedObjectContext:managedObjectContext];
                    NSString *inverseRef = [value objectForKey:self.OBJ_ID_KEY];
                    [newEntity setValue:self.objectsDictionary[inverseRef] forKey:attributeName];
                } else {
                    // A reference.
                    [newEntity setValue:self.objectsDictionary[ref] forKey:attributeName];
                }
            } else if ([value isKindOfClass:[NSArray class]]) {
                NSMutableSet *relationSet = [newEntity mutableSetValueForKey:attributeName];
                for (id object in value) {
                    if ([object isKindOfClass:[NSDictionary class]]) {
                        [self createManagedObjectsForCurrentDictionary:object managedObjectContext:managedObjectContext];
                        NSString *inverseRef = [object objectForKey:self.OBJ_ID_KEY];
                        if (inverseRef == nil) {
                            inverseRef = [object objectForKey:self.OBJ_REF_KEY];
                        }
                        NSManagedObject *managedInverseObject = self.objectsDictionary[inverseRef];
                        [relationSet addObject:managedInverseObject];
                    }
                }
            } else {
                if (![attributeName isEqualToString:self.OBJ_REF_KEY]) {
                    [newEntity setValue:value forKey:attributeName];
                }
            }
        }
    }
    
    if ([newEntity respondsToSelector:@selector(mxn_visitDuringImport)]) {
        [self.mutableVisitedDuringImport addObjectNil:[newEntity mxn_visitDuringImport]];
    }
    
    return newEntity;
}

- (NSArray *)visitedDuringImport
{
    return [self.mutableVisitedDuringImport copy];
}

@end
