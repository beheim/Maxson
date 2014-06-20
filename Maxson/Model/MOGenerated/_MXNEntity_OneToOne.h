// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MXNEntity_OneToOne.h instead.

#import <CoreData/CoreData.h>


extern const struct MXNEntity_OneToOneAttributes {
} MXNEntity_OneToOneAttributes;

extern const struct MXNEntity_OneToOneRelationships {
	__unsafe_unretained NSString *mxn_root;
} MXNEntity_OneToOneRelationships;

extern const struct MXNEntity_OneToOneFetchedProperties {
} MXNEntity_OneToOneFetchedProperties;

@class MXNRoot;


@interface MXNEntity_OneToOneID : NSManagedObjectID {}
@end

@interface _MXNEntity_OneToOne : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MXNEntity_OneToOneID*)objectID;





@property (nonatomic, strong) MXNRoot *mxn_root;

//- (BOOL)validateMxn_root:(id*)value_ error:(NSError**)error_;





@end

@interface _MXNEntity_OneToOne (CoreDataGeneratedAccessors)

@end

@interface _MXNEntity_OneToOne (CoreDataGeneratedPrimitiveAccessors)



- (MXNRoot*)primitiveMxn_root;
- (void)setPrimitiveMxn_root:(MXNRoot*)value;


@end
