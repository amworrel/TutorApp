//
//  StudentViewAllViewController.h
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/30/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentViewAllViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic)IBOutlet NSString *facebookID;

@property(strong, nonatomic)IBOutlet NSMutableArray *dateArray;
@property(strong, nonatomic)IBOutlet NSMutableArray *timeArray;
@property(strong, nonatomic)IBOutlet NSMutableArray *apptIDArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
