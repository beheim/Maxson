// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MXNEntity_ManyToMany.h instead.

#import <CoreData/CoreData.h>


extern const struct MXNEntity_ManyToManyAttributes {
	__unsafe_unretained NSString *mxn_int16;
} MXNEntity_ManyToManyAttributes;

extern const struct MXNEntity_ManyToManyRelationships {
	__unsafe_unretained NSString *mxn_roots;
} MXNEntity_ManyToManyRelationships;

extern const struct MXNEntity_ManyToManyFetchedProperties {
} MXNEntity_ManyToManyFetchedProperties;

@class MXNRoot;



@interface MXNEntity_ManyToManyID : NSManagedObjectID {}
@end

@interface _MXNEntity_ManyToMany : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MXNEntity_ManyToManyID*)objectID;





@property (nonatomic, strong) NSNumber* mxn_int16;



@property int16_t mxn_int16Value;
- (int16_t)mxn_int16Value;
- (void)setMxn_int16Value:(int16_t)value_;

//- (BOOL)validateMxn_int16:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *mxn_roots;

- (NSMutableSet*)mxn_rootsSet;





@end

@interface _MXNEntity_ManyToMany (CoreDataGeneratedAccessors)

- (void)addMxn_roots:(NSSet*)value_;
- (void)removeMxn_roots:(NSSet*)value_;
- (void)addMxn_rootsObject:(MXNRoot*)value_;
- (void)removeMxn_rootsObject:(MXNRoot*)value_;

@end

@interface _MXNEntity_ManyToMany (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveMxn_int16;
- (void)setPrimitiveMxn_int16:(NSNumber*)value;

- (int16_t)primitiveMxn_int16Value;
- (void)setPrimitiveMxn_int16Value:(int16_t)value_;





- (NSMutableSet*)primitiveMxn_roots;
- (void)setPrimitiveMxn_roots:(NSMutableSet*)value;


@end
