//
//  TutorProfileViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/11/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface TutorProfileViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) NSMutableArray *tutorID;

@property (weak, nonatomic) IBOutlet FBProfilePictureView *picture;


@property (weak, nonatomic)IBOutlet UILabel *tutorProfileFirst;

@property(weak, nonatomic) IBOutlet UILabel *tutorProfileLast;

@property(weak, nonatomic) IBOutlet UILabel *tutorProfileUniversity;

@property(weak, nonatomic) IBOutlet UILabel *tutorProfileYear;

@property(weak, nonatomic)IBOutlet UILabel *tutorProfileCourse;



@property(strong, nonatomic)NSMutableArray *dateArray;

@property(strong, nonatomic)NSMutableArray *timeArray;

@property(strong, nonatomic)NSMutableArray *apptIDArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic)NSMutableArray *nameArray;

@property(strong, nonatomic)NSMutableArray *reviewArray;

@property (weak, nonatomic) IBOutlet UITableView *reviewTable;

@end
