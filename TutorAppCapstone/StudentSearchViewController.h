//
//  StudentSearchViewController.h
//  TutorAppCapstone
//
//  Created by Devault, Charles Joseph on 3/2/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentSearchViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) NSArray *listItems;

@property (strong, nonatomic) NSMutableArray *cellResults;

@property(strong, nonatomic) NSString *test;

@property(strong, nonatomic) NSString *fname;
@property(strong, nonatomic) NSString *lname;



@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property(strong, nonatomic) NSMutableArray *nameArray;
@property(strong, nonatomic) NSMutableArray *courseArray;


- (IBAction)submitSearch:(id)sender;



@property IBOutlet UITableView *tableView;



@end
