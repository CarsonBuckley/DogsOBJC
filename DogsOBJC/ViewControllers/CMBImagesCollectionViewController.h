//
//  CMBImagesCollectionViewController.h
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMBBreed.h"
#import "CMBSubBreed.h"
#import "CMBImageCollectionViewCell.h"
#import "CMBBreedNetworkClient.h"
#import "DogsOBJC-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@class CMBBreed;
@class CMBSubBreed;

@interface CMBImagesCollectionViewController : UICollectionViewController
//properties
@property (nonatomic, strong) CMBBreed * breed;
@property (nonatomic, strong) CMBSubBreed * subBreed;
@property (nonatomic) NSArray * imageURLs;

//functions
-(void)fetchImageURLs;

@end

NS_ASSUME_NONNULL_END
