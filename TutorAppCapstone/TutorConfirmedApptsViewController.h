//
//  TutorConfirmedApptsViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/26/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorConfirmedApptsViewController : UIViewController <UITableViewDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong, nonatomic)NSMutableArray *dateArray;
@property(strong, nonatomic)NSMutableArray *timeArray;
@property(strong, nonatomic)NSMutableArray *apptIDArray;
@property(weak, nonatomic) IBOutlet NSString *facebookID;



@end
