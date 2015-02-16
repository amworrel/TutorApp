//
//  ViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 1/29/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "LogInViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "SelectionViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.loginView.readPermissions = @[@"public_profile"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    
    NSLog(@"%@", user.name);
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    NSLog(@"You are logged in!");
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    NSLog(@"You are logged out!");
}

-(void)showSelectionScreen {
    [self performSegueWithIdentifier:@"LogInSegue" sender:self];
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    NSString *alertMessage, *alertTitle;
    
    if ([FBErrorUtility shouldNotifyUserForError:error])
    {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
    }
    else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession)
    {
        alertTitle = @"Session Error";
        alertMessage = @"Your Current session is no longer valid. Please log in again.";
    }
    else if ([FBErrorUtility errorCategoryForError:error] ==FBErrorCategoryUserCancelled)
    {
        NSLog(@"user cancelled login");
    }
    else
    {
        alertTitle = @"Something went wrong";
        alertMessage = @"Please try again later";
        NSLog(@"Unexpected error %@", error);
    }
    if (alertMessage)
    {
        [[[UIAlertView alloc] initWithTitle:alertTitle message:alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
        
}

@end
