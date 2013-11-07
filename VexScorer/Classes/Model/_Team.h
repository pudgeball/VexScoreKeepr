// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Team.h instead.

#import <CoreData/CoreData.h>


extern const struct TeamAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *number;
} TeamAttributes;

extern const struct TeamRelationships {
	__unsafe_unretained NSString *blueMatch;
	__unsafe_unretained NSString *redMatch;
} TeamRelationships;

extern const struct TeamFetchedProperties {
} TeamFetchedProperties;

@class Match;
@class Match;




@interface TeamID : NSManagedObjectID {}
@end

@interface _Team : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TeamID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* number;



@property int32_t numberValue;
- (int32_t)numberValue;
- (void)setNumberValue:(int32_t)value_;

//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Match *blueMatch;

//- (BOOL)validateBlueMatch:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Match *redMatch;

//- (BOOL)validateRedMatch:(id*)value_ error:(NSError**)error_;





@end

@interface _Team (CoreDataGeneratedAccessors)

@end

@interface _Team (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveNumber;
- (void)setPrimitiveNumber:(NSNumber*)value;

- (int32_t)primitiveNumberValue;
- (void)setPrimitiveNumberValue:(int32_t)value_;





- (Match*)primitiveBlueMatch;
- (void)setPrimitiveBlueMatch:(Match*)value;



- (Match*)primitiveRedMatch;
- (void)setPrimitiveRedMatch:(Match*)value;


@end
