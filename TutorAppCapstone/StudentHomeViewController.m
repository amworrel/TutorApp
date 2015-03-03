//
//  StudentHomeViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "StudentHomeViewController.h"

@interface StudentHomeViewController ()

@end

@implementation StudentHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set as view controller object and data source for text labels
    /*
    NSString *strURL = [NSString stringWithFormat:@"http://cgi.soic.indiana.edu/~team14/get_student.php"];
    
    // exectue PHP code];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL [URLWithString:strURL];
    
    //to retrieve reutrned values
    NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding)]];
    */
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)StudentHomeSearchBar{
    
    [self performSegueWithIdentifier:@"searchSegue" sender:self];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
