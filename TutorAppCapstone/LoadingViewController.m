//
//  LoadingViewController.m
//  TutorAppCapstone
//
//  Created by Worrell, Amy Marie on 3/11/15.
//  Copyright (c) 2015 Worrell, Amy Marie. All rights reserved.
//

#import "LoadingViewController.h"
#import "StudentHomeViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    StudentHomeViewController *SHVC = [[StudentHomeViewController alloc]init];
  
    //double delayInSeconds = 5.0;
    //dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    //dispatch_after(popTime,dispatch_get_main_queue(),^(void){
    [self presentViewController: SHVC  animated:YES completion:nil];
    //});

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
