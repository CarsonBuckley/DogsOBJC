//
//  CMBSubBreedsListTableViewController.h
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CMBBreed;

NS_ASSUME_NONNULL_BEGIN

@interface CMBSubBreedsListTableViewController : UITableViewController

@property (nonatomic, strong) CMBBreed * breed;

@end

NS_ASSUME_NONNULL_END
