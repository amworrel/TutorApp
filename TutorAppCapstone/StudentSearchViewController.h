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

@property (strong, nonatomic) NSMutableArray *nameArray;
@property (strong, nonatomic) NSMutableArray *courseArray;
@property (strong, nonatomic) NSMutableArray *idArray;
@property(strong, nonatomic) NSString *test;





@property (weak, nonatomic) IBOutlet UITextField *searchText;


- (IBAction)submitSearch:(id)sender;



@property IBOutlet UITableView *tableView;


@end
