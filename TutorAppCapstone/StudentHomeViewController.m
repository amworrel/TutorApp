//
//  StudentHomeViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 2/12/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "StudentHomeViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@interface StudentHomeViewController ()

@end

@implementation StudentHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set as view controller object and data source for text labels
    /*
    NSString *strURL = [NSString stringWithFormat:@"http://cgi.soic.indiana.edu/~team14/get_student.php"];
    
    // exectue PHP code];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL [URLWithString:strURL];
    
    //to retrieve reutrned values
    NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding)]];
    */
    
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
        self.studentHomeFirst.text = [result objectForKey:@"first_name"];
        self.studentHomeLast.text = [result objectForKey:@"last_name"];
        
        self.picture.profileID = _facebookID;
    
        
        NSInteger success = 0;
        
        
        NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@", self.facebookID.self];
        
        
        NSLog(@"PostData: %@", post);
        
        NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_student_home.php"];
        
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
            self.studentHomeFirst.text = [result objectForKey:@"fname"];
            self.studentHomeLast.text = [result objectForKey:@"lname"];
            self.studentHomeUniversity.text = [result objectForKey:@"university"];
            self.studentYear.text=[result objectForKey:@"year"];
        
            NSLog(@"first: %@", self.studentHomeFirst.text);
        }
        
    }];
    
    self.dateArray = [[NSMutableArray alloc] init];
    self.timeArray = [[NSMutableArray alloc] init];
    self.apptIDArray = [[NSMutableArray alloc] init];
    
    NSArray *fBpermissions = [[NSArray alloc] initWithObjects:@"first_name",@"last_name",@"picture", nil];
    
    [FBSession openActiveSessionWithReadPermissions:fBpermissions
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session,
                                                      FBSessionState status,
                                                      NSError *fbError) {
                                  }];
    
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *fbError) {
        NSLog(@"%@", [result objectForKey:@"id"]);
        
        
        
        self.facebookID = [result objectForKey:@"id"];
        
        
        
        NSInteger success = 0;
        
        
        NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@",self.facebookID.self];
        
        
        NSLog(@"PostData: %@", post);
        
        NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_student_home_as_student.php"];
        
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
            NSString *date = [result objectForKey:@"date"];
            NSString *startTime = [result objectForKey:@"startTime"];
            NSString *endTime = [result objectForKey:@"endTime"];
            NSString *apptID = [result objectForKey:@"apptID"];
            
            NSString *tempTime = [startTime stringByAppendingString:@"-"];
            NSString *wholeTime = [tempTime stringByAppendingString:endTime];
            [self.timeArray addObject:wholeTime];
            [self.dateArray addObject:date];
            [self.apptIDArray addObject:apptID];
            
        }
        
        NSLog(@"dateArray: %@", self.dateArray);
        NSLog(@"timeArray: %@", self.timeArray);
    }];

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dateArray count];
    return [self.timeArray count];
    
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *SimpleIdentifier = @"SimpleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
    
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleIdentifier];
    }
    
    cell.textLabel.text = self.dateArray[indexPath.row];
    cell.detailTextLabel.text = self.timeArray[indexPath.row];
    
    
    return cell;
    
    
}



-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
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
