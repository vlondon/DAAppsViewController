//
//  DAAppsViewController.h
//  DAAppsViewController
//
//  Created by Daniel Amitay on 4/3/13.
//  Copyright (c) 2013 Daniel Amitay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAAppsViewController : UITableViewController
+ (DAAppsViewController *)sharedInstance;

// we need to show HUD during load operations
// but we do not want to use any dependecies (for non-Pods users?)
// ok, then we use block delegation
@property (nonatomic, copy) void (^loadingBlock)(BOOL loading, NSError *error);
@property (nonatomic, copy) void (^didViewAppBlock)(NSInteger appId);

// why result bool? if we fail - we got an error, otherwise - controller
- (void)loadAppsWithArtistId:(NSInteger)artistId excludeIds:(NSArray *)excludeIds
             completionBlock:(void(^)(DAAppsViewController *controller, NSError *error))block;

- (void)loadAppsWithAppIds:(NSArray *)appIds completionBlock:(void(^)(BOOL result, NSError *error))block;
- (void)loadAppsWithBundleIds:(NSArray *)bundleIds completionBlock:(void(^)(BOOL result, NSError *error))block;
- (void)loadAppsWithSearchTerm:(NSString *)searchTerm completionBlock:(void(^)(BOOL result, NSError *error))block;

- (void)presentAppWithId:(NSNumber *)appId fromViewController:(UIViewController *)vc completion:(void (^)(NSError *error))completionBlock;

@end
