// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Score.h instead.

#import <CoreData/CoreData.h>


extern const struct ScoreAttributes {
	__unsafe_unretained NSString *autonomous;
	__unsafe_unretained NSString *corner;
	__unsafe_unretained NSString *finale;
	__unsafe_unretained NSString *goal;
} ScoreAttributes;

extern const struct ScoreRelationships {
	__unsafe_unretained NSString *blueMatch;
	__unsafe_unretained NSString *redMatch;
} ScoreRelationships;

extern const struct ScoreFetchedProperties {
} ScoreFetchedProperties;

@class Match;
@class Match;






@interface ScoreID : NSManagedObjectID {}
@end

@interface _Score : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ScoreID*)objectID;





@property (nonatomic, strong) NSNumber* autonomous;



@property int32_t autonomousValue;
- (int32_t)autonomousValue;
- (void)setAutonomousValue:(int32_t)value_;

//- (BOOL)validateAutonomous:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* corner;



@property int32_t cornerValue;
- (int32_t)cornerValue;
- (void)setCornerValue:(int32_t)value_;

//- (BOOL)validateCorner:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* finale;



@property int32_t finaleValue;
- (int32_t)finaleValue;
- (void)setFinaleValue:(int32_t)value_;

//- (BOOL)validateFinale:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* goal;



@property int32_t goalValue;
- (int32_t)goalValue;
- (void)setGoalValue:(int32_t)value_;

//- (BOOL)validateGoal:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Match *blueMatch;

//- (BOOL)validateBlueMatch:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Match *redMatch;

//- (BOOL)validateRedMatch:(id*)value_ error:(NSError**)error_;





@end

@interface _Score (CoreDataGeneratedAccessors)

@end

@interface _Score (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAutonomous;
- (void)setPrimitiveAutonomous:(NSNumber*)value;

- (int32_t)primitiveAutonomousValue;
- (void)setPrimitiveAutonomousValue:(int32_t)value_;




- (NSNumber*)primitiveCorner;
- (void)setPrimitiveCorner:(NSNumber*)value;

- (int32_t)primitiveCornerValue;
- (void)setPrimitiveCornerValue:(int32_t)value_;




- (NSNumber*)primitiveFinale;
- (void)setPrimitiveFinale:(NSNumber*)value;

- (int32_t)primitiveFinaleValue;
- (void)setPrimitiveFinaleValue:(int32_t)value_;




- (NSNumber*)primitiveGoal;
- (void)setPrimitiveGoal:(NSNumber*)value;

- (int32_t)primitiveGoalValue;
- (void)setPrimitiveGoalValue:(int32_t)value_;





- (Match*)primitiveBlueMatch;
- (void)setPrimitiveBlueMatch:(Match*)value;



- (Match*)primitiveRedMatch;
- (void)setPrimitiveRedMatch:(Match*)value;


@end
