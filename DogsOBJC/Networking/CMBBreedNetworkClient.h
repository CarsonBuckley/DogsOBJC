//
//  CMBBreedNetworkClient.h
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import <Foundation/Foundation.h>
//Classes needed for the Networking Client
@class CMBBreed;
@class CMBImage;
@class CMBSubBreed;

@interface CMBBreedNetworkClient : NSObject

//Fetch a list of all breeds and sub breeds
- (void)fetchAllBreeds: (void (^) (NSArray *))completion;

//fetch breed image URLs
//https://dog.ceo/api/breed/hound/images
- (void)fetchBreedImageURLs:(CMBBreed *)breed completion:(void (^) (NSArray *))completion;

//fetch subbreed image URLs
//https://dog.ceo/api/breed/hound/basset/images
- (void)fetchSubBreedImageURLs:(CMBSubBreed *)subBreed breed:(CMBBreed *)breed completion:(void (^) (NSArray *))completion;

//fetch image data
- (void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *imageData, NSError *error))completion;

//shared instance method
+ (CMBBreedNetworkClient *)sharedController;

@end

