//
//  TutorProfileViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/11/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorProfileViewController : UIViewController

@property (weak, nonatomic)IBOutlet NSString *tutorID;

@property (weak, nonatomic)IBOutlet UILabel *sendTutor;

@property (weak, nonatomic)IBOutlet UILabel *tutorProfileFirst;

@property(weak, nonatomic) IBOutlet UILabel *tutorProfileLast;

@property(weak, nonatomic) IBOutlet UILabel *tutorProfileUniversity;

@property(weak, nonatomic) IBOutlet UILabel *tutorProfileYear;

@property(weak, nonatomic)IBOutlet UILabel *tutorProfileCourse;

@property(weak, nonatomic)IBOutlet UILabel *tutorProfileCode;


@end
