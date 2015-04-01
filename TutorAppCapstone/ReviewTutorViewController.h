//
//  ReviewTutorViewController.h
//  TutorAppCapstone
//
//  Created by Amy Worrell on 3/31/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ReviewTutorViewController : UIViewController

@property (weak, nonatomic)IBOutlet NSMutableArray *apptID;
@property (weak, nonatomic)IBOutlet NSString *facebookID;
@property (weak, nonatomic) IBOutlet UILabel *reviewTutorFirst;
@property (weak, nonatomic) IBOutlet UILabel *reviewTutorLast;
@property (weak, nonatomic) IBOutlet UILabel *reviewStudentFirst;
@property (weak, nonatomic) IBOutlet UILabel *reviewStudentLast;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *tutorPicture;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *studentPicture;
@property (weak, nonatomic) IBOutlet NSString *tutorID;
- (IBAction)submitReview:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *reviewText;
- (IBAction)backgroundTap:(id)sender;

@end
