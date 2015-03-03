//
//  StudentSearchViewController.h
//  TutorAppCapstone
//
//  Created by Devault, Charles Joseph on 3/2/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentSearchViewController : UIViewController<UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDelegate>{
    
    NSString *category;
    NSString *name;
}

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *name;

+ (id)tutorOfCategory:(NSString*)category name:(NSString*)name;


@property (strong,nonatomic) NSArray *tutorArray;

@property (strong,nonatomic) NSMutableArray *filteredTutorArray;

@property IBOutlet UISearchBar *tutorSearchBar;


@property IBOutlet UITableView *tableView;
@end
