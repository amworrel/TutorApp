//
//  StudentCreateViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentCreateViewController : UIViewController


- (IBAction)studentCreateSubmitButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *studentCreateUniversity;
@property (weak, nonatomic) IBOutlet UITextField *studentCreateYear;
@property (weak, nonatomic) IBOutlet UITextField *studentCreateMajor;
@property (weak, nonatomic) IBOutlet UITextField *studentCreateFirst;
@property (weak, nonatomic) IBOutlet UITextField *studentCreateLast;



@end
