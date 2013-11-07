// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Match.m instead.

#import "_Match.h"

const struct MatchAttributes MatchAttributes = {
	.number = @"number",
};

const struct MatchRelationships MatchRelationships = {
	.blueScore = @"blueScore",
	.blueTeams = @"blueTeams",
	.redScore = @"redScore",
	.redTeams = @"redTeams",
};

const struct MatchFetchedProperties MatchFetchedProperties = {
};

@implementation MatchID
@end

@implementation _Match

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Match" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Match";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Match" inManagedObjectContext:moc_];
}

- (MatchID*)objectID {
	return (MatchID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"numberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"number"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic number;



- (int32_t)numberValue {
	NSNumber *result = [self number];
	return [result intValue];
}

- (void)setNumberValue:(int32_t)value_ {
	[self setNumber:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveNumberValue {
	NSNumber *result = [self primitiveNumber];
	return [result intValue];
}

- (void)setPrimitiveNumberValue:(int32_t)value_ {
	[self setPrimitiveNumber:[NSNumber numberWithInt:value_]];
}





@dynamic blueScore;

	

@dynamic blueTeams;

	
- (NSMutableSet*)blueTeamsSet {
	[self willAccessValueForKey:@"blueTeams"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"blueTeams"];
  
	[self didAccessValueForKey:@"blueTeams"];
	return result;
}
	

@dynamic redScore;

	

@dynamic redTeams;

	






@end
