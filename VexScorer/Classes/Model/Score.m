#import "Score.h"


@interface Score ()

// Private interface goes here.

@end


@implementation Score

- (NSNumber *)finalScore {
	return @(self.autonomousValue + self.goalValue + self.cornerValue + self.finaleValue);
}

@end
