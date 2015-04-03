//
//  TutorApptDetailsViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 4/3/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface TutorApptDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *first;

@property (weak, nonatomic) IBOutlet UILabel *last;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *rate;
@property (weak, nonatomic) IBOutlet UILabel *details;
@property (weak, nonatomic)IBOutlet NSString *facebookID;
@property (strong, nonatomic) IBOutlet NSMutableArray *apptID;
@property (weak, nonatomic) IBOutlet NSString *studentID;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *tutorPicture;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *studentPicture;

@end
