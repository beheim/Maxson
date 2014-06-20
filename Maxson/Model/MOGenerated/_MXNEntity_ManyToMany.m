// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MXNEntity_ManyToMany.m instead.

#import "_MXNEntity_ManyToMany.h"

const struct MXNEntity_ManyToManyAttributes MXNEntity_ManyToManyAttributes = {
	.mxn_int16 = @"mxn_int16",
};

const struct MXNEntity_ManyToManyRelationships MXNEntity_ManyToManyRelationships = {
	.mxn_roots = @"mxn_roots",
};

const struct MXNEntity_ManyToManyFetchedProperties MXNEntity_ManyToManyFetchedProperties = {
};

@implementation MXNEntity_ManyToManyID
@end

@implementation _MXNEntity_ManyToMany

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MXNEntity_ManyToMany" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MXNEntity_ManyToMany";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MXNEntity_ManyToMany" inManagedObjectContext:moc_];
}

- (MXNEntity_ManyToManyID*)objectID {
	return (MXNEntity_ManyToManyID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"mxn_int16Value"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"mxn_int16"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic mxn_int16;



- (int16_t)mxn_int16Value {
	NSNumber *result = [self mxn_int16];
	return [result shortValue];
}

- (void)setMxn_int16Value:(int16_t)value_ {
	[self setMxn_int16:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveMxn_int16Value {
	NSNumber *result = [self primitiveMxn_int16];
	return [result shortValue];
}

- (void)setPrimitiveMxn_int16Value:(int16_t)value_ {
	[self setPrimitiveMxn_int16:[NSNumber numberWithShort:value_]];
}





@dynamic mxn_roots;

	
- (NSMutableSet*)mxn_rootsSet {
	[self willAccessValueForKey:@"mxn_roots"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"mxn_roots"];
  
	[self didAccessValueForKey:@"mxn_roots"];
	return result;
}
	






@end
