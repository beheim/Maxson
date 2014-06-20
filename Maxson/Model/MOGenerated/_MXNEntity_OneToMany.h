// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MXNEntity_OneToMany.h instead.

#import <CoreData/CoreData.h>


extern const struct MXNEntity_OneToManyAttributes {
} MXNEntity_OneToManyAttributes;

extern const struct MXNEntity_OneToManyRelationships {
	__unsafe_unretained NSString *mxn_root;
} MXNEntity_OneToManyRelationships;

extern const struct MXNEntity_OneToManyFetchedProperties {
} MXNEntity_OneToManyFetchedProperties;

@class MXNRoot;


@interface MXNEntity_OneToManyID : NSManagedObjectID {}
@end

@interface _MXNEntity_OneToMany : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MXNEntity_OneToManyID*)objectID;





@property (nonatomic, strong) MXNRoot *mxn_root;

//- (BOOL)validateMxn_root:(id*)value_ error:(NSError**)error_;





@end

@interface _MXNEntity_OneToMany (CoreDataGeneratedAccessors)

@end

@interface _MXNEntity_OneToMany (CoreDataGeneratedPrimitiveAccessors)



- (MXNRoot*)primitiveMxn_root;
- (void)setPrimitiveMxn_root:(MXNRoot*)value;


@end
