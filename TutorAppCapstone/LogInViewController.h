//
//  ViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 1/29/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController : UIViewController <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *loginView;



@end

