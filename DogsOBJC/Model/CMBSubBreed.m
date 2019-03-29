//
//  CMBSubBreed.m
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import "CMBSubBreed.h"

@implementation CMBSubBreed

- (instancetype)initWithName: (NSString *)name imageURLs:(NSArray *)imageURLs
{
    
    self = [super init];
    if(self) {
        _name = name;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
