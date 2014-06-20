// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MXNRoot.h instead.

#import <CoreData/CoreData.h>


extern const struct MXNRootAttributes {
	__unsafe_unretained NSString *mxn_bool;
	__unsafe_unretained NSString *mxn_data;
	__unsafe_unretained NSString *mxn_date;
	__unsafe_unretained NSString *mxn_decimal;
	__unsafe_unretained NSString *mxn_double;
	__unsafe_unretained NSString *mxn_int16;
	__unsafe_unretained NSString *mxn_int32;
	__unsafe_unretained NSString *mxn_int64;
	__unsafe_unretained NSString *mxn_string;
	__unsafe_unretained NSString *mxn_transformable;
} MXNRootAttributes;

extern const struct MXNRootRelationships {
	__unsafe_unretained NSString *mxn_entity_manyToMany;
	__unsafe_unretained NSString *mxn_entity_oneToMany;
	__unsafe_unretained NSString *mxn_entity_oneToOne;
} MXNRootRelationships;

extern const struct MXNRootFetchedProperties {
} MXNRootFetchedProperties;

@class MXNEntity_ManyToMany;
@class MXNEntity_OneToMany;
@class MXNEntity_OneToOne;










@class NSObject;

@interface MXNRootID : NSManagedObjectID {}
@end

@interface _MXNRoot : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MXNRootID*)objectID;





@property (nonatomic, strong) NSNumber* mxn_bool;



@property BOOL mxn_boolValue;
- (BOOL)mxn_boolValue;
- (void)setMxn_boolValue:(BOOL)value_;

//- (BOOL)validateMxn_bool:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* mxn_data;



//- (BOOL)validateMxn_data:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* mxn_date;



//- (BOOL)validateMxn_date:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* mxn_decimal;



//- (BOOL)validateMxn_decimal:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* mxn_double;



@property double mxn_doubleValue;
- (double)mxn_doubleValue;
- (void)setMxn_doubleValue:(double)value_;

//- (BOOL)validateMxn_double:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* mxn_int16;



@property int16_t mxn_int16Value;
- (int16_t)mxn_int16Value;
- (void)setMxn_int16Value:(int16_t)value_;

//- (BOOL)validateMxn_int16:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* mxn_int32;



@property int32_t mxn_int32Value;
- (int32_t)mxn_int32Value;
- (void)setMxn_int32Value:(int32_t)value_;

//- (BOOL)validateMxn_int32:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* mxn_int64;



@property int64_t mxn_int64Value;
- (int64_t)mxn_int64Value;
- (void)setMxn_int64Value:(int64_t)value_;

//- (BOOL)validateMxn_int64:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* mxn_string;



//- (BOOL)validateMxn_string:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) id mxn_transformable;



//- (BOOL)validateMxn_transformable:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *mxn_entity_manyToMany;

- (NSMutableSet*)mxn_entity_manyToManySet;




@property (nonatomic, strong) NSSet *mxn_entity_oneToMany;

- (NSMutableSet*)mxn_entity_oneToManySet;




@property (nonatomic, strong) MXNEntity_OneToOne *mxn_entity_oneToOne;

//- (BOOL)validateMxn_entity_oneToOne:(id*)value_ error:(NSError**)error_;





@end

@interface _MXNRoot (CoreDataGeneratedAccessors)

- (void)addMxn_entity_manyToMany:(NSSet*)value_;
- (void)removeMxn_entity_manyToMany:(NSSet*)value_;
- (void)addMxn_entity_manyToManyObject:(MXNEntity_ManyToMany*)value_;
- (void)removeMxn_entity_manyToManyObject:(MXNEntity_ManyToMany*)value_;

- (void)addMxn_entity_oneToMany:(NSSet*)value_;
- (void)removeMxn_entity_oneToMany:(NSSet*)value_;
- (void)addMxn_entity_oneToManyObject:(MXNEntity_OneToMany*)value_;
- (void)removeMxn_entity_oneToManyObject:(MXNEntity_OneToMany*)value_;

@end

@interface _MXNRoot (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveMxn_bool;
- (void)setPrimitiveMxn_bool:(NSNumber*)value;

- (BOOL)primitiveMxn_boolValue;
- (void)setPrimitiveMxn_boolValue:(BOOL)value_;




- (NSData*)primitiveMxn_data;
- (void)setPrimitiveMxn_data:(NSData*)value;




- (NSDate*)primitiveMxn_date;
- (void)setPrimitiveMxn_date:(NSDate*)value;




- (NSDecimalNumber*)primitiveMxn_decimal;
- (void)setPrimitiveMxn_decimal:(NSDecimalNumber*)value;




- (NSNumber*)primitiveMxn_double;
- (void)setPrimitiveMxn_double:(NSNumber*)value;

- (double)primitiveMxn_doubleValue;
- (void)setPrimitiveMxn_doubleValue:(double)value_;




- (NSNumber*)primitiveMxn_int16;
- (void)setPrimitiveMxn_int16:(NSNumber*)value;

- (int16_t)primitiveMxn_int16Value;
- (void)setPrimitiveMxn_int16Value:(int16_t)value_;




- (NSNumber*)primitiveMxn_int32;
- (void)setPrimitiveMxn_int32:(NSNumber*)value;

- (int32_t)primitiveMxn_int32Value;
- (void)setPrimitiveMxn_int32Value:(int32_t)value_;




- (NSNumber*)primitiveMxn_int64;
- (void)setPrimitiveMxn_int64:(NSNumber*)value;

- (int64_t)primitiveMxn_int64Value;
- (void)setPrimitiveMxn_int64Value:(int64_t)value_;




- (NSString*)primitiveMxn_string;
- (void)setPrimitiveMxn_string:(NSString*)value;




- (id)primitiveMxn_transformable;
- (void)setPrimitiveMxn_transformable:(id)value;





- (NSMutableSet*)primitiveMxn_entity_manyToMany;
- (void)setPrimitiveMxn_entity_manyToMany:(NSMutableSet*)value;



- (NSMutableSet*)primitiveMxn_entity_oneToMany;
- (void)setPrimitiveMxn_entity_oneToMany:(NSMutableSet*)value;



- (MXNEntity_OneToOne*)primitiveMxn_entity_oneToOne;
- (void)setPrimitiveMxn_entity_oneToOne:(MXNEntity_OneToOne*)value;


@end
