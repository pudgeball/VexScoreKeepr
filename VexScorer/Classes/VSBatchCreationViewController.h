//
//  VSBatchCreationViewController.h
//  VexScorer
//
//  Created by Nicholas McGuire on 11/8/2013.
//  Copyright (c) 2013 RND Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSBatchCreationViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *createBatchButton;

@property (weak, nonatomic) IBOutlet UITextField *initialMatchTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastMatchTextField;
@property (weak, nonatomic) IBOutlet UITextField *matchOffsetTextField;

- (IBAction)pressedCreateButton:(id)sender;
- (IBAction)pressedCancelButton:(id)sender;

@end
