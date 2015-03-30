//
//  SelectionViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface SelectionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *firstName;

@property (weak, nonatomic) IBOutlet UILabel *lastName;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *picture;

@property (weak, nonatomic) IBOutlet NSString *facebookID;

@property (weak, nonatomic) IBOutlet UIButton *studentProfileButton;
@property (weak, nonatomic) IBOutlet UIButton *tutorProfileButton;
@property (weak, nonatomic) IBOutlet UIButton *enterStudentProfile;
@property (weak, nonatomic) IBOutlet UIButton *enterTutorProfile;



@end
