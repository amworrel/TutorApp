//
//  StudentUpdateViewController.h
//  TutorAppCapstone
//
//  Created by Amy Worrell on 3/31/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentUpdateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *updateStudentFirst;

@property (weak, nonatomic) IBOutlet UITextField *updateStudentLast;
@property (weak, nonatomic) IBOutlet UITextField *updateStudentUniversity;
@property (weak, nonatomic) IBOutlet UITextField *updateStudentYear;
@property (weak, nonatomic) IBOutlet UITextField *updateStudentMajor;
@property (weak, nonatomic) IBOutlet NSString *facebookID;

- (IBAction)updateStudent:(id)sender;


@end
