//
//  SelectionViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "SelectionViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "StudentCreateViewController.h"



@interface SelectionViewController ()

-(void)toggleNoProfile:(BOOL)shouldHide;

-(void)toggleStudentProfile:(BOOL)shouldHide;

-(void)toggleTutorProfile:(BOOL)shouldHide;

-(void)toggleBothProfile:(BOOL)shouldHide;

@end

@implementation SelectionViewController

-(void)toggleNoProfile:(BOOL)shouldHide {
    self.enterStudentProfile.hidden =shouldHide;
    self.enterTutorProfile.hidden = shouldHide;
}

-(void)toggleStudentProfile:(BOOL)shouldHide {
    self.studentProfileButton.hidden = shouldHide;
    self.enterTutorProfile.hidden = shouldHide;
}

-(void)toggleTutorProfile:(BOOL)shouldHide {
    self.tutorProfileButton.hidden = shouldHide;
    self.enterStudentProfile.hidden = shouldHide;
}

-(void)toggleBothProfile:(BOOL)shouldHide {
    self.tutorProfileButton.hidden = shouldHide;
    self.studentProfileButton.hidden = shouldHide;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    NSArray *permissions = [[NSArray alloc] initWithObjects:@"first_name",@"last_name",@"user_location",@"email",@"basic_info",@"picture", nil];
    
    [FBSession openActiveSessionWithReadPermissions:permissions
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session,
                                                      FBSessionState status,
                                                      NSError *fbError) {
                                  }];
    
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *fbError) {
        NSLog(@"%@", [result objectForKey:@"id"]);
        NSLog(@"%@", [result objectForKey:@"first_name"]);
        NSLog(@"%@", [result objectForKey:@"last_name"]);

        
        self.facebookID = [result objectForKey:@"id"];
        self.firstName.text = [result objectForKey:@"first_name"];
        self.lastName.text = [result objectForKey:@"last_name"];
        self.picture.profileID = _facebookID;

    
  
    NSInteger success = 0;
    
    
    NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@", self.facebookID.self];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/account_server2.php"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];
    
    NSLog(@"URLRequest: %@", request);
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response code: %ld", (long)[response statusCode]);
    
    NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"Response ==> %@", responseData);
    
    NSDictionary *jsonData = [NSJSONSerialization
                              JSONObjectWithData:urlData
                              options:NSJSONReadingMutableContainers
                              error:&error];
    success = [jsonData[@"success"] integerValue];
    NSLog(@"Success: %ld", (long)success);
    
        if ([responseData  isEqual: @"4"]) {
            [self toggleNoProfile:YES];
        }
        if ([responseData isEqual: @"2"]) {
            [self toggleStudentProfile:YES];
        }
        if ([responseData  isEqual:@"3"]) {
            [self toggleTutorProfile:YES];
        }
        
        if ([responseData  isEqual: @"1"]) {
            [self toggleBothProfile:YES];
        }
        
        

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

@end
