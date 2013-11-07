// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Score.m instead.

#import "_Score.h"

const struct ScoreAttributes ScoreAttributes = {
	.autonomous = @"autonomous",
	.corner = @"corner",
	.finale = @"finale",
	.goal = @"goal",
};

const struct ScoreRelationships ScoreRelationships = {
	.blueMatch = @"blueMatch",
	.redMatch = @"redMatch",
};

const struct ScoreFetchedProperties ScoreFetchedProperties = {
};

@implementation ScoreID
@end

@implementation _Score

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Score" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Score";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Score" inManagedObjectContext:moc_];
}

- (ScoreID*)objectID {
	return (ScoreID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"autonomousValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"autonomous"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"cornerValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"corner"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"finaleValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"finale"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"goalValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"goal"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic autonomous;



- (int32_t)autonomousValue {
	NSNumber *result = [self autonomous];
	return [result intValue];
}

- (void)setAutonomousValue:(int32_t)value_ {
	[self setAutonomous:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAutonomousValue {
	NSNumber *result = [self primitiveAutonomous];
	return [result intValue];
}

- (void)setPrimitiveAutonomousValue:(int32_t)value_ {
	[self setPrimitiveAutonomous:[NSNumber numberWithInt:value_]];
}





@dynamic corner;



- (int32_t)cornerValue {
	NSNumber *result = [self corner];
	return [result intValue];
}

- (void)setCornerValue:(int32_t)value_ {
	[self setCorner:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCornerValue {
	NSNumber *result = [self primitiveCorner];
	return [result intValue];
}

- (void)setPrimitiveCornerValue:(int32_t)value_ {
	[self setPrimitiveCorner:[NSNumber numberWithInt:value_]];
}





@dynamic finale;



- (int32_t)finaleValue {
	NSNumber *result = [self finale];
	return [result intValue];
}

- (void)setFinaleValue:(int32_t)value_ {
	[self setFinale:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveFinaleValue {
	NSNumber *result = [self primitiveFinale];
	return [result intValue];
}

- (void)setPrimitiveFinaleValue:(int32_t)value_ {
	[self setPrimitiveFinale:[NSNumber numberWithInt:value_]];
}





@dynamic goal;



- (int32_t)goalValue {
	NSNumber *result = [self goal];
	return [result intValue];
}

- (void)setGoalValue:(int32_t)value_ {
	[self setGoal:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveGoalValue {
	NSNumber *result = [self primitiveGoal];
	return [result intValue];
}

- (void)setPrimitiveGoalValue:(int32_t)value_ {
	[self setPrimitiveGoal:[NSNumber numberWithInt:value_]];
}





@dynamic blueMatch;

	

@dynamic redMatch;

	






@end
