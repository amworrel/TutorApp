//
//  StudentApptDetailsViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/30/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentApptDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *studentDetailsFirst;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsLast;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsDate;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsLocation;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsRate;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsDetail;
@property (weak, nonatomic) IBOutlet UILabel *studentDetailsTime;

@property (weak, nonatomic)IBOutlet NSMutableArray *apptID;

@end
