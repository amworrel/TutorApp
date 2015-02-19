//
//  StudentCreateViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "StudentCreateViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@interface StudentCreateViewController ()

@end



@implementation StudentCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *permissions = [[NSArray alloc] initWithObjects: @"id",@"first_name",@"last_name",@"user_location",@"email",@"basic_info",@"picture", nil];
    
    [FBSession openActiveSessionWithReadPermissions:permissions
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session,
                                                      FBSessionState status,
                                                      NSError *error) {
                                  }];
    
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        NSLog(@"%@", [result objectForKey:@"id"]);
        NSLog(@"%@", [result objectForKey:@"first_name"]);
        NSLog(@"%@", [result objectForKey:@"last_name"]);
        NSLog(@"%@", [result objectForKey:@"picture"]);
        
        
        self.facebookID = [result objectForKey:@"id"];
        self.firstName.text = [result objectForKey:@"first_name"];
        self.lastName.text = [result objectForKey:@"last_name"];
        //self.picture.profileID = _facebookID;
        
        
        
        
    }];
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

- (IBAction)studentCreateSubmitButton:(id)sender {
    
    NSString *first = self.studentCreateFirst.text;
    
    NSString *last = self.studentCreateLast.text;
    
    NSString *university = self.studentCreateUniversity.text;
    
    NSString *year = self.studentCreateYear.text;
    
    NSString *major = self.studentCreateMajor.text;
    
    NSLog(first);
    
    NSLog(last);
   
    NSLog(university);
    
    NSLog(year);
    
    NSLog(major);
    
    
}
@end
