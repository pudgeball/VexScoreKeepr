#import "Score.h"

static NSInteger kAutonomousMod = 20;
static NSInteger kCornerMod = 1;
static NSInteger kGoalMod = 5;
static NSInteger kFinaleMod = 20;

@interface Score ()

// Private interface goes here.

@end


@implementation Score

- (NSNumber *)finalScore {
	return @((self.autonomousValue * kAutonomousMod) + (self.goalValue * kGoalMod) + (self.cornerValue * kCornerMod) + (self.finaleValue * kFinaleMod));
}

@end
