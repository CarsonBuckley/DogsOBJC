//
//  CMBBreed.h
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CMBSubBreed;

NS_ASSUME_NONNULL_BEGIN

@interface CMBBreed : NSObject

@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, copy, readonly) NSArray * subBreeds;
@property (nonatomic, copy, readonly) NSArray * imageURLs;

//MARK: - Initialization

- (instancetype)initWithName:(NSString *)name subBreeds:(NSArray *)subBreeds imageURLs:(NSArray *)imageURLs ;

@end

NS_ASSUME_NONNULL_END
