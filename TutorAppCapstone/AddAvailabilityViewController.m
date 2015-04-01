//
//  AddAvailabilityViewController.m
//  TutorAppCapstone
//
//  Created by Mizraji, Joshua Alan on 3/24/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "AddAvailabilityViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface AddAvailabilityViewController ()

@end

@implementation AddAvailabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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




- (IBAction)backgroundTap:(id)sender {
     [self.view endEditing:YES];
}

- (IBAction)addAppt:(id)sender {
    
    NSArray *permissions = [[NSArray alloc] initWithObjects:@"first_name",@"last_name",@"picture", nil];
    
    [FBSession openActiveSessionWithReadPermissions:permissions
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session,
                                                      FBSessionState status,
                                                      NSError *fbError) {
                                  }];
    
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *fbError) {
        NSLog(@"%@", [result objectForKey:@"id"]);
        
        
        
        self.facebookID = [result objectForKey:@"id"];

    
    NSString *tempMonth = [self.addMonth.text stringByAppendingString:@"/"];
    NSString *tempDay = [tempMonth stringByAppendingString:self.addDay.text];
    NSString *tempYear = [tempDay stringByAppendingString:@"/"];
    NSString *finalDate = [tempYear stringByAppendingString:self.addYear.text];
    
    NSLog(@"Date:", finalDate);
    
    NSString *tempStart = [self.addStartHour.text stringByAppendingString:@":"];
    NSString *tempStartMin = [tempStart stringByAppendingString:self.addStartMinutes.text];
    NSString *finalStart = [tempStartMin stringByAppendingString:self.addStartPMAM.text];
    
    NSLog(@"Start Time: ", finalStart);
    
    NSString *tempEnd = [self.addEndHour.text stringByAppendingString:@":"];
    NSString *tempEndMin = [tempEnd stringByAppendingString:self.addEndMinutes.text];
    NSString *finalEnd = [tempEndMin stringByAppendingString:self.addEndPMAM.text];

    NSLog(@"End time:", finalEnd);
    
    
    
    
    
    NSInteger success = 0;
    
    
    NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@&date=%@&startTime=%@&endTime=%@&location=%@&rate=%@&details=%@", self.facebookID.self, finalDate, finalStart, finalEnd, [self.addLocation text], [self.addRate text], [self.addDetails text]];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/post_insert_avail.php"];
    
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
