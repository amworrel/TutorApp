//
//  StudentSearchViewController.m
//  TutorAppCapstone
//
//  Created by Devault, Charles Joseph on 3/2/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "StudentSearchViewController.h"


@interface StudentSearchViewController ()

@end

@implementation StudentSearchViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameArray = [[NSMutableArray alloc] init];
    self.courseArray = [[NSMutableArray alloc] init];
    
    
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
    // Perform segue to candy detail
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
    //
    //    for(id key in jsonData) {
    //        id value = [jsonData objectForKey:key];
    //
    //        NSString *keyAsString = (NSString *)key;
    //        NSString *valueAsString = (NSString *)value;
    //
    //        NSLog(@"key: %@", keyAsString);
    //        NSLog(@"value: %@", valueAsString);
    //    }
    
    
    NSArray *results = [jsonData valueForKeyPath:@"resultArray"];
    NSLog(@"Results %@", results);
    
    for (NSDictionary *result in jsonData) {
        NSString *fname = [result objectForKey:@"fname"];
        NSString *lname = [result objectForKey:@"lname"];
        NSString *courseCode = [result objectForKey:@"courseCode"];
        NSString *courseID = [result objectForKey:@"courseID"];
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
    }
    NSLog(@"firstArray: %@", self.nameArray);
    NSLog(@"firstArray: %@", self.courseArray);
    
    
    
    //NSLog(@"Success: %ld", (long)success);
    
    //NSLog(@"Json Data", jsonData);
    
    
    //    NSString *stringW = [responseData stringByReplacingOccurrencesOfString:@"\"" withString:@"" options:NSCaseInsensitiveSearch range:(NSRange){0,[responseData length]}];
    //
    //    NSString *newString =[stringW stringByReplacingOccurrencesOfString:@"{CONCAT(t.fname,' ',t.lname)" withString:@""];
    //
    //     NSString *finalString =[newString stringByReplacingOccurrencesOfString:@"}" withString:@""];
    //
    //    NSMutableArray *resultsArray = [finalString componentsSeparatedByString:@":"];
    //
    
    /* NSInteger count = [resultsArray count];
     for (id obj in resultsArray){
     
     if ([obj isEqualToString:@""]) {
     [resultsArray removeObjectAtIndex:];
     }
     }
     */
    
    
    //success = [jsonData[@"success"] integerValue];
    
    
    
    //NSString *resultString= [responseData componentsSeparatedByString:@":"];
    
    
    //NSMutableArray *resultsArray = [responseData componentsSeparatedByString:@":"];
    
    //NSString *resultsString = [resultsArray componentsJoinedByString:@":"];
    
    
    
    
    
    
    //for (id obj in resultsArray)
    //[self.resultsArray addObject:obj];
    
    
    
    //for (i = 0; i < [resultsArray count]; i++ )
    //id resultsArrayElement = [resultsArray ]
    //if(i % 2)!= 0{
    // [self.resultsArray addObject:obj];
    // }
    
    //for (id obj in resultsArray)
    //NSLog(@"obj: %@", obj);
    
    
    //self.test = JSON.parse(jsonData);
    
    
    //var obj = responseData.parseJSON('{"fname": "Amy"}');
    
    
    return [self.tableView reloadData];
    
    
    
    
    
}




@end