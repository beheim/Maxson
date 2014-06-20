// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MXNEntity_OneToOne.m instead.

#import "_MXNEntity_OneToOne.h"

const struct MXNEntity_OneToOneAttributes MXNEntity_OneToOneAttributes = {
};

const struct MXNEntity_OneToOneRelationships MXNEntity_OneToOneRelationships = {
	.mxn_root = @"mxn_root",
};

const struct MXNEntity_OneToOneFetchedProperties MXNEntity_OneToOneFetchedProperties = {
};

@implementation MXNEntity_OneToOneID
@end

@implementation _MXNEntity_OneToOne

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MXNEntity_OneToOne" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MXNEntity_OneToOne";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MXNEntity_OneToOne" inManagedObjectContext:moc_];
}

- (MXNEntity_OneToOneID*)objectID {
	return (MXNEntity_OneToOneID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic mxn_root;

	






@end
