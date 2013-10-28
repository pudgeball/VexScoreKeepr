//
//  VSMatchCell.m
//  VexScorer
//
//  Created by Nick McGuire on 10/24/2013.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import "VSMatchCell.h"

@interface VSMatchCell ()

@property (strong, nonatomic) UIView *matchNumberView;
@property (strong, nonatomic) UILabel *matchLabel;

@property (strong, nonatomic) UIView *scoreViews;

@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UILabel *redLabel;
@property (strong, nonatomic) UILabel *redScoreLabel;

@property (strong, nonatomic) UIView *blueView;
@property (strong, nonatomic) UILabel *blueLabel;
@property (strong, nonatomic) UILabel *blueScoreLabel;

@end

@implementation VSMatchCell

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.matchNumberView = [UIView new];
		self.matchLabel = [UILabel new];
		
		self.scoreViews = [UIView new];
		
		self.redView = [UIView new];
		self.redLabel = [UILabel new];
		self.redScoreLabel = [UILabel new];
		
		self.blueView = [UIView new];
		self.blueLabel = [UILabel new];
		self.blueScoreLabel = [UILabel new];
		
		NSDictionary *views = NSDictionaryOfVariableBindings(_matchNumberView, _matchLabel, _scoreViews, _redView, _redLabel, _redScoreLabel, _blueView, _blueLabel, _blueScoreLabel);
		
		for (UIView *view in views.allValues) {
			view.translatesAutoresizingMaskIntoConstraints = NO;
		}
		
		
		[self.matchNumberView addSubview:self.matchLabel];
		
		[self.redView addSubview:self.redLabel];
		[self.redView addSubview:self.redScoreLabel];
		[self.blueView addSubview:self.blueLabel];
		[self.blueView addSubview:self.blueScoreLabel];
		
		[self.scoreViews addSubview:self.redView];
		[self.scoreViews addSubview:self.blueView];
		
		[self.contentView addSubview:self.matchNumberView];
		[self.contentView addSubview:self.scoreViews];
		
		[self configureViews];
		[self setUpConstraints:views];
	}
	return self;
}

- (void)configureViews {
	self.layer.cornerRadius = 10;
	self.layer.borderWidth = 2;
	self.layer.borderColor = [UIColor blackColor].CGColor;
	
	self.clipsToBounds = YES;
	
	self.matchNumberView.backgroundColor = [UIColor clearColor];
	
	self.matchLabel.textAlignment = NSTextAlignmentCenter;
	self.matchLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:24.0];
	self.matchLabel.backgroundColor = [UIColor clearColor];
	
	self.redView.backgroundColor = [UIColor redColor];
	
	self.redLabel.textAlignment = NSTextAlignmentCenter;
	self.redLabel.textColor = [UIColor whiteColor];
	self.redLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:20.0];
	self.redLabel.text = @"Red";
	
	self.redScoreLabel.textAlignment = NSTextAlignmentCenter;
	self.redScoreLabel.textColor = [UIColor whiteColor];
	self.redScoreLabel.font = [UIFont fontWithName:@"Avenir" size:20.0];
	self.redLabel.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
	
	self.blueView.backgroundColor = [UIColor blueColor];
	
	self.blueLabel.textAlignment = NSTextAlignmentCenter;
	self.blueLabel.textColor = [UIColor whiteColor];
	self.blueLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:20.0];
	self.blueLabel.text = @"Blue";
	
	self.blueScoreLabel.textAlignment = NSTextAlignmentCenter;
	self.blueScoreLabel.textColor = [UIColor whiteColor];
	self.blueScoreLabel.font = [UIFont fontWithName:@"Avenir" size:20.0];
	self.blueLabel.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
}

- (void)setUpConstraints:(NSDictionary *)views {
	//Set up the match label and view
	[self.matchNumberView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_matchLabel]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
	[self.matchNumberView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_matchLabel]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
	
	//Set up the views inside score label
	[self.scoreViews addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_redView][_blueView(==_redView)]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
	[self.scoreViews addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_redView]|" options:NSLayoutFormatAlignAllLeft metrics:nil views:views]];
	[self.scoreViews addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_blueView]|" options:NSLayoutFormatAlignAllLeft metrics:nil views:views]];
	
	[self.redView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_redLabel]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
	[self.redView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_redScoreLabel]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
	[self.redView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_redLabel(30)]-[_redScoreLabel]-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:views]];
	
	[self.blueView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_blueLabel]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
	[self.blueView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_blueScoreLabel]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
	[self.blueView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_blueLabel(30)]-[_blueScoreLabel]-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:views]];
	
	//Set up the total view
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_matchNumberView]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scoreViews]|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_matchNumberView(40)]-0-[_scoreViews]|" options:NSLayoutFormatAlignAllLeft metrics:nil views:views]];
}

- (void)setMatchNumber:(NSNumber *)matchNumber {
	self.matchLabel.text = [NSString stringWithFormat:@"Match %@", matchNumber];
}

- (void)setRedScore:(NSNumber *)redScore {
	self.redScoreLabel.text = [redScore stringValue];
}

- (void)setBlueScore:(NSNumber *)blueScore {
	self.blueScoreLabel.text = [blueScore stringValue];
}

- (void)setSelected:(BOOL)selected {
	CGColorRef ref = (selected) ? [UIColor colorWithHue:0.326 saturation:0.549 brightness:0.957 alpha:1.000].CGColor : [UIColor blackColor].CGColor;
	CGFloat borderWidth = (selected) ? 4.0 : 2.0;
	
	self.layer.borderColor = ref;
	self.layer.borderWidth = borderWidth;
}

@end
