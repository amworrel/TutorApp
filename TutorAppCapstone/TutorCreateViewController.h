//
//  TutorSelectionViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface TutorCreateViewController : UIViewController <UITextFieldDelegate> 

- (IBAction)tutorCreateSubmitButton:(id)sender;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *picture;

@property (weak, nonatomic) IBOutlet UILabel *tutorCreateFirst;
@property (weak, nonatomic) IBOutlet UILabel *tutorCreateLast;
@property (weak, nonatomic) IBOutlet UITextField *tutorCreateUniversity;
@property (weak, nonatomic) IBOutlet UITextField *tutorCreateYear;
@property (weak, nonatomic) IBOutlet UITextField *tutorCreateMajor;
@property (weak, nonatomic) IBOutlet UITextField *tutorCreateCourses;
@property (weak, nonatomic) IBOutlet UITextField *tutorCreateBio;
@property (weak, nonatomic) IBOutlet NSString *facebookID;

- (IBAction)backgroundTutorTap:(id)sender;


@end
