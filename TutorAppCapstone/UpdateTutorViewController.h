//
//  UpdateTutorViewController.h
//  TutorAppCapstone
//
//  Created by Amy Worrell on 3/31/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "LogInViewController.h"

@interface UpdateTutorViewController : ViewController

@property (weak, nonatomic) IBOutlet UITextField *updateTutorFirst;
@property (weak, nonatomic) IBOutlet UITextField *updateTutorLast;

@property (weak, nonatomic) IBOutlet UITextField *updateTutorUniversity;
@property (weak, nonatomic) IBOutlet UITextField *updateTutorYear;
@property (weak, nonatomic) IBOutlet UITextField *updateTutorMajor;
@property (weak, nonatomic) IBOutlet UITextField *updateTutorCourseCode;
@property (weak, nonatomic) IBOutlet UITextField *updateTutorCourseID;
@property (weak, nonatomic) IBOutlet NSString *facebookID;
- (IBAction)updateTutor:(id)sender;

@end
