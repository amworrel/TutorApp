//
//  StudentSearchViewController.m
//  TutorAppCapstone
//
//  Created by Devault, Charles Joseph on 3/2/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "StudentSearchViewController.h"
#import "TutorProfileViewController.h"


@interface StudentSearchViewController ()

@end

@implementation StudentSearchViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameArray = [[NSMutableArray alloc] init];
    self.courseArray = [[NSMutableArray alloc] init];
    self.idArray = [[NSMutableArray alloc] init];
    
    
    //[self.listItems addObject:@"One"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.nameArray count];
    return [self.courseArray count];
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *SimpleIdentifier = @"SimpleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
    
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleIdentifier];
    }
    
    cell.textLabel.text = self.nameArray[indexPath.row];
    cell.detailTextLabel.text = self.courseArray[indexPath.row];
    
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TutorProfileViewController *TPVC = [[TutorProfileViewController alloc]init];
    // Perform segue to candy detail
    
    TPVC.tutorID = self.idArray[indexPath.row];
    NSLog(@"IDArray %@", TPVC.tutorID);
    

    
    [self performSegueWithIdentifier:@"tutorDetail" sender:tableView];
    
}





- (IBAction)submitSearch:(id)sender {
    
    NSInteger success = 0;
    
    
    NSString *post = [[NSString alloc] initWithFormat:@"searchText=%@", [self.searchText text]];
    
    
    NSLog(@"PostData: %@", post);
    
    NSURL *url =[NSURL URLWithString:@"http://cgi.soic.indiana.edu/~team14/search.php"];
    
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
        NSString *fname = [result objectForKey:@"fname"];
        NSString *lname = [result objectForKey:@"lname"];
        NSString *courseCode = [result objectForKey:@"courseCode"];
        NSString *courseID = [result objectForKey:@"courseID"];
        NSString *tutorID  = [result objectForKey:@"tutorAcctID"];
        NSLog(@"first: %@", fname);
        NSLog(@"last: %@", lname);
        NSLog(@"courseCode: %@",courseCode);
        NSLog(@"courseID: %@", courseID);
        NSString *tempCourse = [courseCode stringByAppendingString:@"-"];
        NSString *wholeCourse = [tempCourse stringByAppendingString:courseID];
        NSString *tempName = [fname stringByAppendingString:@" "];
        NSString *wholeName = [tempName stringByAppendingString:lname];
        [self.nameArray addObject:wholeName];
        [self.courseArray addObject:wholeCourse];
        [self.idArray addObject:tutorID];
    }
    NSLog(@"firstArray: %@", self.nameArray);
    NSLog(@"firstArray: %@", self.courseArray);
    NSLog(@"ID %@", self.idArray);
    
    
    
    return [self.tableView reloadData];
    
    
    
    
    
}




@end