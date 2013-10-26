//
//  VSMatchCell.h
//  VexScorer
//
//  Created by Nick McGuire on 10/24/2013.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface VSMatchCell : UICollectionViewCell

- (void)setMatchNumber:(NSNumber *)matchNumber;
- (void)setRedScore:(NSNumber *)redScore;
- (void)setBlueScore:(NSNumber *)blueScore;

@end
