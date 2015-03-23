//
//  TutorProfileViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/11/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "TutorProfileViewController.h"
#import "StudentSearchViewController.h"

@interface TutorProfileViewController ()

@end

@implementation TutorProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"ID: %@", self.tutorID);
    
    NSInteger success = 0;
    
    NSString *hardCodeID = @"10152584384891555";
    NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@", hardCodeID];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_select_tutor.php"];
    
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
        self.tutorProfileFirst.text = [result objectForKey:@"fname"];
        self.tutorProfileLast.text = [result objectForKey:@"lname"];
        self.tutorProfileUniversity.text = [result objectForKey:@"university"];
        self.tutorProfileYear.text=[result objectForKey:@"year"];
        self.tutorProfileCourse.text =[result objectForKey:@"courseCode"];
        self.tutorProfileCode.text = [result objectForKey:@"courseID"];
        
        NSLog(@"first: %@", self.tutorProfileFirst.text);
    }
    
   
    //NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@", hardCodeID];
    
    
    NSLog(@"PostData: %@", post);
    
    //NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_select_tutor.php"];
    
    //NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *appointmentRequest = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];
    
    NSLog(@"URLRequest: %@", request);
    
    NSError *apptError = [[NSError alloc] init];
    NSHTTPURLResponse *apptResponse = nil;
    NSData *apptUrlData=[NSURLConnection sendSynchronousRequest:appointmentRequest returningResponse:&apptResponse error:&apptError];
    
    NSLog(@"Response code: %ld", (long)[apptResponse statusCode]);
    
    NSString *apptStringData = [[NSString alloc]initWithData:apptUrlData encoding:NSUTF8StringEncoding];
    NSLog(@"StringResponse ==> %@", apptStringData);
    
    NSMutableData *apptResponseData = [[NSMutableData alloc] initWithData:apptUrlData];
    NSLog(@"Response ==> %@", apptResponseData);
    
    NSDictionary *apptJsonData = [NSJSONSerialization
                              JSONObjectWithData:apptResponseData
                              options:NSJSONReadingMutableLeaves
                              error:&apptError];
    
    
    
    NSArray *apptResults = [apptJsonData valueForKeyPath:@"ApptresultArray"];
    NSLog(@"ApptResults %@", apptResults);
    
    for (NSDictionary *apptResult in apptJsonData) {
        NSString *date= [apptResult objectForKey:@"fname"];
        NSString *startTime = [apptResult objectForKey:@"lname"];
        NSString *endTime = [apptResult objectForKey:@"university"];
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

@end
