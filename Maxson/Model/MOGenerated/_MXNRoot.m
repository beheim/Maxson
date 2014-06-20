// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MXNRoot.m instead.

#import "_MXNRoot.h"

const struct MXNRootAttributes MXNRootAttributes = {
	.mxn_bool = @"mxn_bool",
	.mxn_data = @"mxn_data",
	.mxn_date = @"mxn_date",
	.mxn_decimal = @"mxn_decimal",
	.mxn_double = @"mxn_double",
	.mxn_int16 = @"mxn_int16",
	.mxn_int32 = @"mxn_int32",
	.mxn_int64 = @"mxn_int64",
	.mxn_string = @"mxn_string",
	.mxn_transformable = @"mxn_transformable",
};

const struct MXNRootRelationships MXNRootRelationships = {
	.mxn_entity_manyToMany = @"mxn_entity_manyToMany",
	.mxn_entity_oneToMany = @"mxn_entity_oneToMany",
	.mxn_entity_oneToOne = @"mxn_entity_oneToOne",
};

const struct MXNRootFetchedProperties MXNRootFetchedProperties = {
};

@implementation MXNRootID
@end

@implementation _MXNRoot

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MXNRoot" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MXNRoot";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MXNRoot" inManagedObjectContext:moc_];
}

- (MXNRootID*)objectID {
	return (MXNRootID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"mxn_boolValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"mxn_bool"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"mxn_doubleValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"mxn_double"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"mxn_int16Value"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"mxn_int16"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"mxn_int32Value"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"mxn_int32"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"mxn_int64Value"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"mxn_int64"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic mxn_bool;



- (BOOL)mxn_boolValue {
	NSNumber *result = [self mxn_bool];
	return [result boolValue];
}

- (void)setMxn_boolValue:(BOOL)value_ {
	[self setMxn_bool:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveMxn_boolValue {
	NSNumber *result = [self primitiveMxn_bool];
	return [result boolValue];
}

- (void)setPrimitiveMxn_boolValue:(BOOL)value_ {
	[self setPrimitiveMxn_bool:[NSNumber numberWithBool:value_]];
}





@dynamic mxn_data;






@dynamic mxn_date;






@dynamic mxn_decimal;






@dynamic mxn_double;



- (double)mxn_doubleValue {
	NSNumber *result = [self mxn_double];
	return [result doubleValue];
}

- (void)setMxn_doubleValue:(double)value_ {
	[self setMxn_double:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveMxn_doubleValue {
	NSNumber *result = [self primitiveMxn_double];
	return [result doubleValue];
}

- (void)setPrimitiveMxn_doubleValue:(double)value_ {
	[self setPrimitiveMxn_double:[NSNumber numberWithDouble:value_]];
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





@dynamic mxn_int32;



- (int32_t)mxn_int32Value {
	NSNumber *result = [self mxn_int32];
	return [result intValue];
}

- (void)setMxn_int32Value:(int32_t)value_ {
	[self setMxn_int32:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveMxn_int32Value {
	NSNumber *result = [self primitiveMxn_int32];
	return [result intValue];
}

- (void)setPrimitiveMxn_int32Value:(int32_t)value_ {
	[self setPrimitiveMxn_int32:[NSNumber numberWithInt:value_]];
}





@dynamic mxn_int64;



- (int64_t)mxn_int64Value {
	NSNumber *result = [self mxn_int64];
	return [result longLongValue];
}

- (void)setMxn_int64Value:(int64_t)value_ {
	[self setMxn_int64:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveMxn_int64Value {
	NSNumber *result = [self primitiveMxn_int64];
	return [result longLongValue];
}

- (void)setPrimitiveMxn_int64Value:(int64_t)value_ {
	[self setPrimitiveMxn_int64:[NSNumber numberWithLongLong:value_]];
}





@dynamic mxn_string;






@dynamic mxn_transformable;






@dynamic mxn_entity_manyToMany;

	
- (NSMutableSet*)mxn_entity_manyToManySet {
	[self willAccessValueForKey:@"mxn_entity_manyToMany"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"mxn_entity_manyToMany"];
  
	[self didAccessValueForKey:@"mxn_entity_manyToMany"];
	return result;
}
	

@dynamic mxn_entity_oneToMany;

	
- (NSMutableSet*)mxn_entity_oneToManySet {
	[self willAccessValueForKey:@"mxn_entity_oneToMany"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"mxn_entity_oneToMany"];
  
	[self didAccessValueForKey:@"mxn_entity_oneToMany"];
	return result;
}
	

@dynamic mxn_entity_oneToOne;

	






@end
