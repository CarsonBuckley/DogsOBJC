//
//  CMBBreed.m
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import "CMBBreed.h"

@implementation CMBBreed

- (instancetype)initWithName: (NSString *)name subBreeds: (NSArray<CMBSubBreed *> *)subBreeds imageURLs:(NSArray *)imageURLs
{
    
    self = [super init];
    if(self) {
        _name = name;
        _subBreeds = subBreeds;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
