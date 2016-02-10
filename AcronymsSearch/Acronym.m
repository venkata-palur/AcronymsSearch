//
//  Acronym.m
//  AcronymsSearch
//
//  Created by Venkata Dheeraj Palur on 2/9/16.
//  Copyright © 2016 Venkata Dheeraj Palur. All rights reserved.
//

#import "Acronym.h"

@implementation Acronym

- (id)initWithAcronym:(NSString *)fullForm usedSince:(NSString *)since usageFrequency:(NSString *)frequency {
    if (self = [super init]) {
        _fullForm = fullForm;
        _since = since;
        _usageFrequency = frequency;
    }
    return self;
}

@end
