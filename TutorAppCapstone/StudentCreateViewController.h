//
//  StudentCreateViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentCreateViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *studentFirstName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *studentLastName;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *studentUniversity;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *studentYear;
@property (weak, nonatomic) IBOutlet UITextField *studentMajor;



@end
