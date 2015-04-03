//
//  TutorApptDetailsViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 4/3/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "TutorApptDetailsViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface TutorApptDetailsViewController ()

@end

@implementation TutorApptDetailsViewController

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
        
        
        
        self.facebookID = [result objectForKey:@"id"];
        self.tutorPicture.profileID = _facebookID;
        NSString *post = [[NSString alloc] initWithFormat:@"apptID=%@", self.apptID.self];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_appt_details_as_tutor.php"];
    
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
    
    for (NSDictionary *result in jsonData) {
        self.first.text = [result objectForKey:@"fname"];
        self.last.text = [result objectForKey:@"lname"];
        self.date.text = [result objectForKey:@"date"];
        self.rate.text = [result objectForKey:@"rate"];
        self.details.text=[result objectForKey:@"details"];
        NSString *startTime = [result objectForKey:@"startTime"];
        NSString *endTime= [result objectForKey:@"endTime"];
        NSString *tempTime = [startTime stringByAppendingString:@"-"];
        NSString *finalTime = [tempTime stringByAppendingString:endTime];
        self.studentID = [result objectForKey:@"studAcctID"];
        self.time.text = finalTime;
        self.location.text = [result objectForKey:@"location"];
       
        
        
        NSLog(@"first: %@", self.studentID);
    }
        self.studentPicture.profileID = _studentID;

        
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
