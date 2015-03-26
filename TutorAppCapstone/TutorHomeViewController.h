//
//  TutorHomeViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>



@interface TutorHomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *tutorHomeFirst;

@property (weak, nonatomic) IBOutlet UILabel *tutorHomeLast;

@property (weak, nonatomic) IBOutlet UILabel *tutorHomeUniversity;

@property (weak, nonatomic) IBOutlet UILabel *tutorHomeYear;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *picture;

@property (weak, nonatomic) IBOutlet NSString *facebookID;

@property(strong, nonatomic)NSMutableArray *dateArray;

@property(strong, nonatomic)NSMutableArray *timeArray;

@property(strong, nonatomic)NSMutableArray *apptIDArray;

@property(strong, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)menuButton:(id)sender;


@end
