//
//  TutorProfileViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/11/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "TutorProfileViewController.h"
#import "StudentSearchViewController.h"
#import "ConfirmApptViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface TutorProfileViewController ()

@end

@implementation TutorProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dateArray = [[NSMutableArray alloc] init];
    self.timeArray = [[NSMutableArray alloc] init];
    self.apptIDArray = [[NSMutableArray alloc] init];
    self.nameArray = [[NSMutableArray alloc] init];
    self.reviewArray = [[NSMutableArray alloc] init];
    
    
    NSLog(@"ID: %@", self.tutorID);
    
    NSArray *permissions = [[NSArray alloc] initWithObjects:@"first_name",@"last_name",@"user_location",@"email",@"basic_info",@"picture", nil];
    
    [FBSession openActiveSessionWithReadPermissions:permissions
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session,
                                                      FBSessionState status,
                                                      NSError *fbError) {
                                  }];
    
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *fbError) {
        NSLog(@"%@", [result objectForKey:@"id"]);
        
        
        self.picture.profileID = self.tutorID;
                        
                                  
    }];
    
    //
    //
    //TUTOR INFO DATABASE REQUEST
    
    NSInteger success = 0;
    
    
    NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@", self.tutorID];
    
    
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

        
        NSLog(@"first: %@", self.tutorProfileFirst.text);
    }
    
    //
    //
    //TUTOR APPTS DATABASE
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *apptUrl =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_select_tutor_appts.php"];
    
    NSMutableURLRequest *appointmentRequest = [[NSMutableURLRequest alloc] init];
    [appointmentRequest setURL:apptUrl];
    [appointmentRequest setHTTPMethod:@"POST"];
    [appointmentRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [appointmentRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [appointmentRequest setHTTPBody:postData];
    
    NSLog(@"URLRequest: %@", appointmentRequest);
    
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
        NSString *courseCode =[apptResult objectForKey:@"courseCode"];
        NSString *courseID = [apptResult objectForKey:@"courseID"];
        NSString *tempCourse = [courseCode stringByAppendingString:@"-"];
        NSString *wholeCourse = [tempCourse stringByAppendingString:courseID];
        self.tutorProfileCourse.text = wholeCourse;

        NSString *apptID = [apptResult objectForKey:@"apptID"];
        NSString *date= [apptResult objectForKey:@"date"];
        NSString *startTime = [apptResult objectForKey:@"startTime"];
        NSString *endTime = [apptResult objectForKey:@"endTime"];
        NSString *tempTime = [startTime stringByAppendingString:@"-"];
        NSString *finalTime = [tempTime stringByAppendingString:endTime];
        
        
        [self.dateArray addObject:date];
        [self.timeArray addObject:finalTime];
        [self.apptIDArray addObject:apptID];
       
    }
    //REVIEWS
    


    
    NSLog(@"PostData: %@", post);
    
    NSURL *reviewUrl =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/viewall_reviews.php"];
    
    NSData *reviewPostData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *reviewPostLength = [NSString stringWithFormat:@"%lu", (unsigned long)[reviewPostData length]];
    
    NSMutableURLRequest *reviewRequest = [[NSMutableURLRequest alloc] init];
    [reviewRequest setURL:reviewUrl];
    [reviewRequest setHTTPMethod:@"POST"];
    [reviewRequest setValue:reviewPostLength forHTTPHeaderField:@"Content-Length"];
    [reviewRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [reviewRequest setHTTPBody:reviewPostData];
    
    NSLog(@"URLRequest: %@", reviewRequest);
    
    NSError *reviewError = [[NSError alloc] init];
    NSHTTPURLResponse *reviewResponse = nil;
    NSData *reviewUrlData=[NSURLConnection sendSynchronousRequest:reviewRequest returningResponse:&reviewResponse error:&reviewError];
    
    NSLog(@"Response code: %ld", (long)[reviewResponse statusCode]);
    
    NSString *reviewStringData = [[NSString alloc]initWithData:reviewUrlData encoding:NSUTF8StringEncoding];
    NSLog(@"StringResponse ==> %@", reviewStringData);
    
    NSMutableData *reviewResponseData = [[NSMutableData alloc] initWithData:reviewUrlData];
    NSLog(@"Response ==> %@", reviewResponseData);
    
    NSDictionary *reviewJsonData = [NSJSONSerialization
                              JSONObjectWithData:reviewResponseData
                              options:NSJSONReadingMutableLeaves
                              error:&reviewError];
    
    
    
    NSArray *reviewResults = [reviewJsonData valueForKeyPath:@"resultArray"];
    NSLog(@"Results %@", reviewResults);
    
    for (NSDictionary *reviewResult in reviewJsonData) {
        NSString *studentFirst = [reviewResult objectForKey:@"fname"];
        NSString *studentLast = [reviewResult objectForKey:@"lname"];
        NSString *review = [reviewResult objectForKey:@"eval"];
        NSString *tempName = [studentFirst stringByAppendingString:@" "];
        NSString *fullName = [tempName stringByAppendingString:studentLast];
        [self.nameArray addObject: fullName];
        [self.reviewArray addObject:review];
    }

    
}
    
    -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        if (tableView == self.tableView) {
            return [self.dateArray count];
            return [self.timeArray count];
        }
        if (tableView == self.reviewTable) {
        return [self.reviewArray count];
        }
        else {
            return [self.nameArray count];
        }
    }
    
    -(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
        NSString *SimpleIdentifier = @"SimpleIdentifier";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
        
        
        
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleIdentifier];
        }
        if (tableView == self.tableView) {
        [[cell textLabel] setLineBreakMode:UILineBreakModeWordWrap];
        cell.textLabel.text = self.dateArray[indexPath.row];
        cell.detailTextLabel.text = self.timeArray[indexPath.row];
        }
        else if (tableView == self.reviewTable){
            cell.textLabel.text = self.nameArray[indexPath.row];
            cell.detailTextLabel.text = self.reviewArray[indexPath.row];
            cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
        }
        
        return cell;
        
        
    }
    
    -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        ConfirmApptViewController *CAVC = [[ConfirmApptViewController alloc]init];
        // Perform segue to candy detail
        
        CAVC.apptID = self.apptIDArray[indexPath.row];
        NSLog(@"IDArray %@", CAVC.apptID);
        
        
        
        [self performSegueWithIdentifier:@"apptDetail" sender:tableView];
        
    }
    
    
    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        if ([segue.identifier isEqualToString:@"apptDetail"]) {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            ConfirmApptViewController *destViewController = segue.destinationViewController;
            destViewController.apptID = self.apptIDArray[indexPath.row];
        }
    }
//
//    -(NSInteger)reviewTable:(UITableView *)reviewTable numberOfRowsInSection:(NSInteger)section {
//            return [self.nameArray count];
//            return [self.reviewArray count];
//        }
//        
//    -(UITableViewCell *)reviewTable:(UITableView *) reviewTable cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//            
//            NSString *SimpleIdentifier = @"ReviewIdentifier";
//            
//            UITableViewCell *cell = [reviewTable dequeueReusableCellWithIdentifier:SimpleIdentifier];
//            
//            
//            
//            
//            if (cell == nil) {
//                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleIdentifier];
//            }
//            
//            cell.textLabel.text = self.nameArray[indexPath.row];
//            cell.detailTextLabel.text = self.reviewArray[indexPath.row];
//            
//            
//            return cell;
//            
//            
//        }
//
//
//

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
