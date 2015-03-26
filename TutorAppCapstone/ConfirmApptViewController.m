//
//  ConfirmApptViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/24/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "ConfirmApptViewController.h"
#import "TutorProfileViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface ConfirmApptViewController ()

@end

@implementation ConfirmApptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"apptID: %@", self.apptID);
    NSString *post = [[NSString alloc] initWithFormat:@"selectedAppt=%@", self.apptID.self];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_select_tutor_viewappt.php"];
    
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
        self.confirmTutorFirst.text = [result objectForKey:@"fname"];
        self.confirmTutorLast.text = [result objectForKey:@"lname"];
        self.confirmTutorDate.text = [result objectForKey:@"date"];
        self.confirmTutorRate.text = [result objectForKey:@"rate"];
        self.confirmTutorDetails.text=[result objectForKey:@"details"];
        NSString *startTime = [result objectForKey:@"startTime"];
        NSString *endTime= [result objectForKey:@"endTime"];
        NSString *tempTime = [startTime stringByAppendingString:@"-"];
        NSString *finalTime = [tempTime stringByAppendingString:endTime];
        self.confirmTutorTime.text = finalTime;
        //self.confirmTutorTime.text = [result objectForKey:@"time"];
        self.confirmTutorLocation = [result objectForKey:@"location"];
        
        NSLog(@"first: %@", self.confirmTutorFirst.text);
    }

    
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

- (IBAction)sendStudentID:(id)sender {
    
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
        NSLog(@"%@", [result objectForKey:@"birthday"]);
        NSLog(@"%@", [result objectForKey:@"email"]);
        NSLog(@"%@", [result objectForKey:@"picture"]);
        
        self.facebookID = [result objectForKey:@"id"];
        
        
        
    
    

    
    NSString *post = [[NSString alloc] initWithFormat:@"apptID=%@&studAcctID%@", self.apptID.self, self.facebookID.self];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/conf_appt_as_student.php"];
    
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
