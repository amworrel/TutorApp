//
//  UpdateTutorViewController.m
//  TutorAppCapstone
//
//  Created by Amy Worrell on 3/31/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//
#import <FacebookSDK/FacebookSDK.h>
#import "UpdateTutorViewController.h"

@implementation UpdateTutorViewController

-(void)viewDidLoad:(BOOL)animated{
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
        
        NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/update_tutor_info.php"];
        
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
            self.updateTutorFirst.text = [result objectForKey:@"fname"];
            self.updateTutorLast.text = [result objectForKey:@"lname"];
            self.updateTutorUniversity.text = [result objectForKey:@"university"];
            self.updateTutorMajor.text = [result objectForKey:@"major"];
            self.updateTutorYear.text = [result objectForKey:@"year"];
            self.updateTutorCourseCode.text = [result objectForKey:@"courseCode"];
            self.updateTutorCourseID.text = [result objectForKey:@"courseID"];
            
        }
        NSLog(@"name:", self.updateTutorCourseID.text);
        
    }];

    
    
}

- (IBAction)updateTutor:(id)sender {
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
        
        
        
        NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@&tutorUpdateFirst=%@&tutorUpdateLast=%@&tutorUpdateUniversity=%@&tutorUpdateYear=%@&tutorUpdateMajor=%@&tutorUpdateCode=%@&tutorUpdateCourseID=%@", self.facebookID.self, [self.updateTutorFirst text], [self.updateTutorLast text], [self.updateTutorUniversity text], [self.updateTutorYear text], [self.updateTutorMajor text], [self.updateTutorCourseCode text], [self.updateTutorCourseID text]];

        
        
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
        
    }];
    
}
@end
