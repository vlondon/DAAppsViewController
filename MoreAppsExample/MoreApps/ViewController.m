//
//  ViewController.m
//  MoreApps
//
//  Created by Roman Baulin on 17.06.13.
//  Copyright (c) 2013 Boomfox. All rights reserved.
//

#import "ViewController.h"
#import <DAAppsViewController/DAAppsViewController.h>
#import <SVProgressHUD/SVProgressHUD.h>

#ifdef DEBUG
#   define LOG_MESSAGE(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define LOG_MESSAGE(...)
#endif

@interface ViewController ()
@property (nonatomic, strong) id controller;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMoreApps:(id)sender {
    DAAppsViewController *appsViewController = [[DAAppsViewController alloc] init];
    [appsViewController setTitle:@"More cool apps"];
    [appsViewController setLoadingBlock:^(BOOL loading, NSError *error) {
        if (loading) {
            [SVProgressHUD show];
        }
        else {
            if (error) {
                [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
            }
            else {
                [SVProgressHUD dismiss];
            }
        }
    }];
    
    [SVProgressHUD show];
    [appsViewController loadAppsWithArtistId:475892173 excludeIds:@[@475892170,@537993679,@549439059] completionBlock:^(DAAppsViewController *controller, NSError *error) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
        }
        else {
            [SVProgressHUD dismiss];
            UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:controller];
            [self presentViewController:nc animated:YES completion:nil];
        }
    }];
    
    
}

@end
