//
//  StudentHomeViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface StudentHomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *studentHomeFirst;

@property (weak, nonatomic) IBOutlet UILabel *studentHomeLast;

@property (weak, nonatomic) IBOutlet UILabel *studentHomeUniversity;

@property (weak, nonatomic) IBOutlet UILabel *studentYear;

@property (weak, nonatomic) IBOutlet UISearchBar *StudentHomeSearchBar;


@property (weak, nonatomic) IBOutlet FBProfilePictureView *picture;

@property (weak, nonatomic) IBOutlet NSString *facebookID;

@property(strong, nonatomic)IBOutlet NSMutableArray *dateArray;

@property(strong, nonatomic)IBOutlet NSMutableArray *timeArray;

@property(strong, nonatomic)IBOutlet NSMutableArray *apptIDArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
