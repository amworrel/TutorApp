//
//  UpdateAvailabilityViewController.h
//  TutorAppCapstone
//
//  Created by Mizraji, Joshua Alan on 3/24/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateAvailabilityViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>




@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(weak, nonatomic)IBOutlet NSString *facebookID;

@property(strong, nonatomic)NSMutableArray *dateArray;
@property(strong, nonatomic)NSMutableArray *timeArray;
@property(strong, nonatomic)NSMutableArray *apptIDArray;

@end
