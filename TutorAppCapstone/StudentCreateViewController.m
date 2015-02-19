//
//  StudentCreateViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "StudentCreateViewController.h"
#import "StudentHomeViewController.h"
#import <FacebookSDK/FacebookSDK.h>



@interface StudentCreateViewController ()

@end



@implementation StudentCreateViewController

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
        self.studentCreateFirst.text = [result objectForKey:@"first_name"];
        self.studentCreateLast.text = [result objectForKey:@"last_name"];
        self.picture.profileID = _facebookID;
        
        
        
    }];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Makes the keyboard go away when "return" is hit
-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];
    return YES;
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
    
  
    
    NSString *post = [[NSString alloc] initWithFormat:@"studentCreateFirst=%@&studentCreateLast=%@&studentCreateUniversity=%@&studentCreateYear=%@&studentCreateMajor=%@",[self.studentCreateFirst text], [self.studentCreateLast text], [self.studentCreateUniversity text], [self.studentCreateYear text], [self.studentCreateMajor text]];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", [postData length]];
    NSString *baseurl = @"http:cgi.soic.indiana.edu/~team14/student_insert2.php";
    NSURL *url = [NSURL URLWithString:baseurl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod: @"POST"];
    [urlRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody:postData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    [connection start];
    
    NSLog(@"PostData: %@", post);
    
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
    
    
    
    /*
    NSString *post = [[NSString alloc] initWithFormat:@"studentCreateFirst=%@&studentCreateLast=%@&studentCreateUniversity=%@&studentCreateYear=%@&studentCreateMajor=%@",[self.studentCreateFirst text], [self.studentCreateLast text], [self.studentCreateUniversity text], [self.studentCreateYear text], [self.studentCreateMajor text]];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", [postData length]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"cgi.soic.indiana.edu/~team14/student_insert2.php"]];
    
    
    NSLog(@"PostData: %@", post);
    

    [request setHTTPBody:postData];
    */

    
    
    
    
}
// Tap Gesture that makes keyboard go away when rest of the screen is tapped
- (IBAction)backgroundStudentTap:(id)sender {
    [self.view endEditing:YES];
}
@end
