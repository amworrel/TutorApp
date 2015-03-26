//
//  ConfirmApptViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/24/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmApptViewController : UIViewController


@property (weak, nonatomic)IBOutlet NSMutableArray *apptID;

@property (weak, nonatomic) IBOutlet UILabel *confirmTutorFirst;

@property (weak, nonatomic) IBOutlet UILabel *confirmTutorLast;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorDate;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorLocation;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorRate;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorDetails;
@property (weak, nonatomic) IBOutlet UILabel *confirmTutorTime;
@property(weak, nonatomic) IBOutlet NSString *facebookID;

- (IBAction)sendStudentID:(id)sender;

@end
