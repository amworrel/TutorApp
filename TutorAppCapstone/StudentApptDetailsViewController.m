//
//  StudentApptDetailsViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/30/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "StudentApptDetailsViewController.h"
#import "ReviewTutorViewController.h"

@interface StudentApptDetailsViewController ()

@end

@implementation StudentApptDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *post = [[NSString alloc] initWithFormat:@"apptID=%@", self.apptID.self];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_appt_details_as_student.php"];
    
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
        self.studentDetailsFirst.text = [result objectForKey:@"fname"];
        self.studentDetailsLast.text = [result objectForKey:@"lname"];
        self.studentDetailsDate.text = [result objectForKey:@"date"];
        self.studentDetailsRate.text = [result objectForKey:@"rate"];
        self.studentDetailsDetail.text=[result objectForKey:@"details"];
        NSString *apptID = [result objectForKey:@"apptID"];
        NSString *startTime = [result objectForKey:@"startTime"];
        NSString *endTime= [result objectForKey:@"endTime"];
        NSString *tempTime = [startTime stringByAppendingString:@"-"];
        NSString *finalTime = [tempTime stringByAppendingString:endTime];
        self.studentDetailsTime.text = finalTime;
        self.studentDetailsLocation.text = [result objectForKey:@"location"];
        //self.apptIDArray addObject:apptID;
        
        NSLog(@"first: %@", self.studentDetailsFirst.text);
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

- (IBAction)review:(id)sender {
    ReviewTutorViewController *RTVC = [[ReviewTutorViewController alloc]init];
    // Perform segue to candy detail
    
    RTVC.apptID = self.apptID;
    NSLog(@"IDArray %@", RTVC.apptID);
    
    
    
    [self performSegueWithIdentifier:@"tutorReview" sender:self];
}
@end
