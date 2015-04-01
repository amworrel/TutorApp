//
//  AddAvailabilityViewController.h
//  TutorAppCapstone
//
//  Created by Mizraji, Joshua Alan on 3/24/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAvailabilityViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *addMonth;

@property (weak, nonatomic) IBOutlet UITextField *addDay;

@property (weak, nonatomic) IBOutlet UITextField *addYear;

@property (weak, nonatomic) IBOutlet UITextField *addStartHour;

@property (weak, nonatomic) IBOutlet UITextField *addStartMinutes;

@property (weak, nonatomic) IBOutlet UITextField *addStartPMAM;

@property (weak, nonatomic) IBOutlet UITextField *addEndHour;


@property (weak, nonatomic) IBOutlet UITextField *addEndMinutes;

@property (weak, nonatomic) IBOutlet UITextField *addEndPMAM;


@property (weak, nonatomic) IBOutlet UITextField *addLocation;

@property (weak, nonatomic) IBOutlet UITextField *addRate;

@property (weak, nonatomic) IBOutlet UITextView *addDetails;

@property (weak, nonatomic) IBOutlet NSString *facebookID;

- (IBAction)backgroundTap:(id)sender;


- (IBAction)addAppt:(id)sender;


@end
