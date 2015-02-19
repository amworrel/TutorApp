//
//  StudentCreateViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface StudentCreateViewController : UIViewController


- (IBAction)studentCreateSubmitButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *studentCreateFirst;
@property (weak, nonatomic) IBOutlet UILabel *studentCreateLast;
@property (weak, nonatomic) IBOutlet UITextField *studentCreateUniversity;
@property (weak, nonatomic) IBOutlet UITextField *studentCreateYear;
@property (weak, nonatomic) IBOutlet UITextField *studentCreateMajor;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *picture;


@property (weak, nonatomic) IBOutlet NSString *facebookID;

@end


