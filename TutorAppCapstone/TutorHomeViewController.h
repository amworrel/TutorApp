//
//  TutorHomeViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>



@interface TutorHomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *tutorHomeFirst;

@property (weak, nonatomic) IBOutlet UILabel *tutorHomeLast;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *picture;

@property (weak, nonatomic) IBOutlet NSString *facebookID;

@end
