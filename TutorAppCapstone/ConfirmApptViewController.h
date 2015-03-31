//
//  ConfirmApptViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/24/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ConfirmApptViewController : UIViewController
@property (weak, nonatomic) IBOutlet FBProfilePictureView *tutorPicture;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *studentPicture;


@property (weak, nonatomic)IBOutlet NSMutableArray *apptID;

@property (weak, nonatomic) IBOutlet UILabel *confirmTutorFirst;

@property (weak, nonatomic) IBOutlet UILabel *confirmTutorLast;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorDate;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorLocation;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorRate;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorDetails;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorTime;
@property(weak, nonatomic) IBOutlet NSString *facebookID;
@property (weak, nonatomic)IBOutlet NSString *tutorID;

- (IBAction)sendStudentID:(id)sender;

@end
