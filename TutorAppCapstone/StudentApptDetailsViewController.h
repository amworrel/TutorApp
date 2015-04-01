//
//  StudentApptDetailsViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/30/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface StudentApptDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *studentDetailsFirst;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsLast;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsDate;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsLocation;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsRate;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsDetail;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsTime;
@property (strong, nonatomic) IBOutlet NSMutableArray *apptIDArray;
@property (weak, nonatomic)IBOutlet NSMutableArray *apptID;
- (IBAction)review:(id)sender;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *tutorPicture;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *studentPicture;
@property (weak, nonatomic) IBOutlet NSString *facebookID;
@property (weak, nonatomic) IBOutlet NSString *tutorID;
@end
