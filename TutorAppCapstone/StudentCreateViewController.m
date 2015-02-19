//
//  StudentCreateViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "StudentCreateViewController.h"


@interface StudentCreateViewController ()

@end



@implementation StudentCreateViewController

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

- (IBAction)studentCreateSubmitButton:(id)sender {
   
    /*
    NSString *myRequestString = [[NSString alloc] initWithFormat:@"studentCreateFirst=%@&studentCreateLast=%@&studentCreateUniversity=%@&studentCreateYear=%@&studentCreateMajor=%@",[self.studentCreateFirst text], [self.studentCreateLast text], [self.studentCreateUniversity text], [self.studentCreateYear text], [self.studentCreateMajor text]];
    NSData *myRequestData = [myRequestString dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [ [ NSMutableURLRequest alloc ] initWithURL: [ NSURL URLWithString: @"cgi.soic.indiana.edu/~team14/student_insert2.php" ] ];
    [ request setHTTPMethod: @"POST" ];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [ request setHTTPBody: myRequestData ];
    NSURLResponse *response;
    NSError *err;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&err];
    NSString *content = [NSString stringWithUTF8String:[returnData bytes]];
    NSLog(@"responseData: %@", content);
    
    
    
    
    */
    
    
    
    
    /*
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"cgi.soic.indiana.edu/~team14/student_insert.php"]];
    
    // Specify that it will be a POST request
    request.HTTPMethod = @"POST";
    
    // This is how we set header fields
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    // Convert your data and set your request's HTTPBody property
    NSString *post = @"studentCreateFirst=%@&studentCreateLast=%@&studentCreateUniversity=%@&studentCreateYear=%@&studentCreateMajor=%@";
    NSData *requestBodyData = [post dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = requestBodyData;
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    */
    
    
    
    
   NSString *post = [[NSString alloc] initWithFormat:@"studentCreateFirst=%@&studentCreateLast=%@&studentCreateUniversity=%@&studentCreateYear=%@&studentCreateMajor=%@",[self.studentCreateFirst text], [self.studentCreateLast text], [self.studentCreateUniversity text], [self.studentCreateYear text], [self.studentCreateMajor text]];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"cgi.soic.indiana.edu/~team14/student_insert2.php"]];
    
    
    NSLog(@"PostData: %@", post);
    

    [request setHTTPBody:postData];
    

    
    
    
    
}
@end
