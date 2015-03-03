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

@synthesize category;
@synthesize name;

+ (id)tutorOfCategory:(NSString *)category name:(NSString *)name
{
    StudentSearchViewController *newTutor = [[self alloc] init];
    newTutor.category = category;
    newTutor.name = name;
    return newTutor;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Sample Data for tutorArray
    self.tutorArray = [NSArray arrayWithObjects:
                       [StudentSearchViewController tutorOfCategory:@"I101" name:@"Sam Williams"],
                       [StudentSearchViewController tutorOfCategory:@"K201" name:@"Anne Thompson"],
                       [StudentSearchViewController tutorOfCategory:@"I300" name:@"Tim Franklin"],
                       [StudentSearchViewController tutorOfCategory:@"I101" name:@"Becky Smith"],
                       [StudentSearchViewController tutorOfCategory:@"K201" name:@"Fred Lineman"],
                       [StudentSearchViewController tutorOfCategory:@"I300" name:@"Brittany Baker"],
                       [StudentSearchViewController tutorOfCategory:@"I101" name:@"David Foster"],
                       [StudentSearchViewController tutorOfCategory:@"K201" name:@"Nancy Drew"],
                       [StudentSearchViewController tutorOfCategory:@"I300" name:@"Alec Marksman"],
                       [StudentSearchViewController tutorOfCategory:@"I101" name:@"Tammy Wilson"], nil];
    
    
    
    // Initialize the filteredTutorArray with a capacity equal to the tutorArray's capacity
    self.filteredTutorArray = [NSMutableArray arrayWithCapacity:[self.tutorArray count]];
    
    
    
    // Reload the table
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredTutorArray count];
    } else {
        return [self.tutorArray count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Create a new Tutor Object
    StudentSearchViewController *tutor = nil;
    
    // Check to see whether the normal table or search results table is being displayed and set the Tutor object from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        tutor = [self.filteredTutorArray objectAtIndex:indexPath.row];
    } else {
        tutor = [self.tutorArray objectAtIndex:indexPath.row];
    }
    // Configure the cell
    cell.textLabel.text = tutor.name;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}



#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredTutorArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    self.filteredTutorArray = [NSMutableArray arrayWithArray:[self.tutorArray filteredArrayUsingPredicate:predicate]];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}



-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Perform segue to tutor detail
    [self performSegueWithIdentifier:@"tutorDetail" sender:tableView];
}


#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"tutorDetail"]) {
        UIViewController *tutorDetailViewController = [segue destinationViewController];
        // In order to manipulate the destination view controller, another check on which table (search or normal) is displayed is needed
        if(sender == self.searchDisplayController.searchResultsTableView) {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *destinationTitle = [[self.filteredTutorArray objectAtIndex:[indexPath row]] name];
            [tutorDetailViewController setTitle:destinationTitle];
        }
        else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            NSString *destinationTitle = [[self.tutorArray objectAtIndex:[indexPath row]] name];
            [tutorDetailViewController setTitle:destinationTitle];
        }
        
    }
}















@end
