/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Masashi Beheim
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "NSManagedObject+MXNComparable.h"
#import "Nilus.h"

@implementation NSManagedObject (MXNComparable)

- (BOOL)isEqualToManagedObjectByProperties:(NSManagedObject *)managedObject
{
    NSEntityDescription *selfEntity = [self entity];
    NSEntityDescription *objectEntity = [managedObject entity];
    if (![selfEntity isEqual:objectEntity]) {
        return false;
    }
    NSArray *attributeKeys = [[[self entity] attributesByName] allKeys];
    NSMutableArray *selfValues = [NSMutableArray array];
    NSMutableArray *objectValues = [NSMutableArray array];
    for (NSString *attribute in attributeKeys) {
        [selfValues addObjectNull:[self valueForKey:attribute]];
        [objectValues addObjectNull:[managedObject valueForKey:attribute]];
    }
    BOOL isEqual = [selfValues isEqualToArray:objectValues];
    return isEqual;
}

- (BOOL)isEqualToManagedObjectByObjectID:(NSManagedObject *)managedObject
{
    BOOL isEqual = [self.objectID.URIRepresentation isEqual:managedObject.objectID.URIRepresentation];
    return isEqual;
}

@end
