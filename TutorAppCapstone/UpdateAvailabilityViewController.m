//
//  UpdateAvailabilityViewController.m
//  TutorAppCapstone
//
//  Created by Mizraji, Joshua Alan on 3/24/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "UpdateAvailabilityViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface UpdateAvailabilityViewController ()

@end

@implementation UpdateAvailabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dateArray = [[NSMutableArray alloc] init];
    self.timeArray = [[NSMutableArray alloc] init];
    self.apptIDArray = [[NSMutableArray alloc] init];
    
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
        
    NSLog(@"tutorID: ", self.facebookID);
    
    NSInteger success = 0;
    
    
        NSString *post = [[NSString alloc] initWithFormat:@"acctID=%@",self.facebookID.self];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/get_tutor_all_appts.php"];
    
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
        //NSString *apptID = [result objectForKey:@"apptID"];
       
        NSString *tempTime = [startTime stringByAppendingString:@"-"];
        NSString *wholeTime = [tempTime stringByAppendingString:endTime];
        [self.timeArray addObject:wholeTime];
        [self.dateArray addObject:date];
        //[self.apptIDArray addObject:apptID];
       
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




//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    TutorProfileViewController *TPVC = [[TutorProfileViewController alloc]init];
//    // Perform segue to candy detail
//    
//    TPVC.tutorID = self.idArray[indexPath.row];
//    //NSLog(@"IDArray %@", TPVC.tutorID);
//    
//    
//    
//    [self performSegueWithIdentifier:@"tutorDetail" sender:tableView];
//    
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"tutorDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        TutorProfileViewController *destViewController = segue.destinationViewController;
//        destViewController.tutorID = self.idArray[indexPath.row];
//    }

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
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
