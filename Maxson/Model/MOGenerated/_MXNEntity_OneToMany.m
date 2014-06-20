// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MXNEntity_OneToMany.m instead.

#import "_MXNEntity_OneToMany.h"

const struct MXNEntity_OneToManyAttributes MXNEntity_OneToManyAttributes = {
};

const struct MXNEntity_OneToManyRelationships MXNEntity_OneToManyRelationships = {
	.mxn_root = @"mxn_root",
};

const struct MXNEntity_OneToManyFetchedProperties MXNEntity_OneToManyFetchedProperties = {
};

@implementation MXNEntity_OneToManyID
@end

@implementation _MXNEntity_OneToMany

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MXNEntity_OneToMany" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MXNEntity_OneToMany";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MXNEntity_OneToMany" inManagedObjectContext:moc_];
}

- (MXNEntity_OneToManyID*)objectID {
	return (MXNEntity_OneToManyID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic mxn_root;

	






@end
