//
//  CMBImageCollectionViewCell.m
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import "CMBImageCollectionViewCell.h"
#import "CMBBreedNetworkClient.h"

@implementation CMBImageCollectionViewCell

- (void)prepareForReuse
{
    //when preparing for reuse, use the stock dog image
    [super prepareForReuse];
    self.imageView.image = [UIImage imageNamed:@"dog"];
}

//When ImageURL is set run this
- (void)setImageURL:(NSURL *)imageURL
{
    //fetch image data from imageURL
    [CMBBreedNetworkClient.sharedController fetchImageData:imageURL completion:^(NSData *imageData, NSError *error) {
        if (error || !imageData) {
            NSLog(@"Error fetching image data %@", error);
            return;
        }
        //put back on main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            //set imageView
            self.imageView.image = [UIImage imageWithData:imageData];
        });
    }];
}

@end
