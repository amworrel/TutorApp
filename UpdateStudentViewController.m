//
//  UpdateStudentViewController.m
//  TutorAppCapstone
//
//  Created by Amy Worrell on 3/31/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "UpdateStudentViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation UpdateStudentViewController
-(void)viewDidLoad {
    [super viewDidLoad];


NSArray *permissions = [[NSArray alloc] initWithObjects:@"first_name",@"last_name",@"user_location",@"email",@"basic_info",@"picture", nil];

[FBSession openActiveSessionWithReadPermissions:permissions
                                   allowLoginUI:YES
                              completionHandler:^(FBSession *session,
                                                  FBSessionState status,
                                                  NSError *fbError) {
                              }];


[FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *fbError) {
    NSLog(@"%@", [result objectForKey:@"id"]);
    
    
    
    self.facebookID = [result objectForKey:@"id"];
    
    
    
    NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@", self.facebookID.self];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_student_viewall_appts.php"];
    
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
    
    NSString *stringData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"StringResponse ==> %@", stringData);
    
    NSMutableData *responseData = [[NSMutableData alloc] initWithData:urlData];
    NSLog(@"Response ==> %@", responseData);
    
    NSDictionary *jsonData = [NSJSONSerialization
                              JSONObjectWithData:responseData
                              options:NSJSONReadingMutableLeaves
                              error:&error];
    
    
    
    NSArray *results = [jsonData valueForKeyPath:@"resultArray"];
    NSLog(@"Results %@", results);
    for (NSDictionary *result in jsonData) {
        self.updateStudentFirst.text = [result objectForKey:@"fname"];
        self.updateStudentLast.text = [result objectForKey:@"lname"];
        self.updateStudentUniversity.text = [result objectForKey:@"university"];
        self.updateStudentMajor.text = [result objectForKey:@"major"];
        self.updateStudentYear.text = [result objectForKey:@"year"];
        
    }
    NSLog(@"name:", self.updateStudentFirst.text);
    
}];
}



@end
