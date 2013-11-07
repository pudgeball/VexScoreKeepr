// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Match.h instead.

#import <CoreData/CoreData.h>


extern const struct MatchAttributes {
	__unsafe_unretained NSString *number;
} MatchAttributes;

extern const struct MatchRelationships {
	__unsafe_unretained NSString *blueScore;
	__unsafe_unretained NSString *blueTeams;
	__unsafe_unretained NSString *redScore;
	__unsafe_unretained NSString *redTeams;
} MatchRelationships;

extern const struct MatchFetchedProperties {
} MatchFetchedProperties;

@class Score;
@class Team;
@class Score;
@class Team;



@interface MatchID : NSManagedObjectID {}
@end

@interface _Match : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MatchID*)objectID;





@property (nonatomic, strong) NSNumber* number;



@property int32_t numberValue;
- (int32_t)numberValue;
- (void)setNumberValue:(int32_t)value_;

//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Score *blueScore;

//- (BOOL)validateBlueScore:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *blueTeams;

- (NSMutableSet*)blueTeamsSet;




@property (nonatomic, strong) Score *redScore;

//- (BOOL)validateRedScore:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Team *redTeams;

//- (BOOL)validateRedTeams:(id*)value_ error:(NSError**)error_;





@end

@interface _Match (CoreDataGeneratedAccessors)

- (void)addBlueTeams:(NSSet*)value_;
- (void)removeBlueTeams:(NSSet*)value_;
- (void)addBlueTeamsObject:(Team*)value_;
- (void)removeBlueTeamsObject:(Team*)value_;

@end

@interface _Match (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveNumber;
- (void)setPrimitiveNumber:(NSNumber*)value;

- (int32_t)primitiveNumberValue;
- (void)setPrimitiveNumberValue:(int32_t)value_;





- (Score*)primitiveBlueScore;
- (void)setPrimitiveBlueScore:(Score*)value;



- (NSMutableSet*)primitiveBlueTeams;
- (void)setPrimitiveBlueTeams:(NSMutableSet*)value;



- (Score*)primitiveRedScore;
- (void)setPrimitiveRedScore:(Score*)value;



- (Team*)primitiveRedTeams;
- (void)setPrimitiveRedTeams:(Team*)value;


@end
