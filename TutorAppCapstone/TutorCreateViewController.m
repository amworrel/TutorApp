//
//  TutorSelectionViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "TutorCreateViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface TutorCreateViewController ()

@end

@implementation TutorCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *permissions = [[NSArray alloc] initWithObjects:@"first_name",@"last_name",@"user_location",@"email",@"basic_info",@"picture", nil];
    
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
        NSLog(@"%@", [result objectForKey:@"birthday"]);
        NSLog(@"%@", [result objectForKey:@"email"]);
        NSLog(@"%@", [result objectForKey:@"picture"]);
        
        self.facebookID = [result objectForKey:@"id"];
        self.tutorCreateFirst.text = [result objectForKey:@"first_name"];
        self.tutorCreateLast.text = [result objectForKey:@"last_name"];
        self.picture.profileID = _facebookID;
        
        
        
    }];

}
// Makes the keyboard go away when "return" is hit
-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];
    return YES;
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

// Tap Gesture that makes keyboard go away when rest of the screen is tapped
- (IBAction)backgroundTutorTap:(id)sender {
    [self.view endEditing:YES];
}
@end
