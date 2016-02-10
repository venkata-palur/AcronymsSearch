//
//  Acronym.h
//  AcronymsSearch
//
//  Created by Venkata Dheeraj Palur on 2/9/16.
//  Copyright © 2016 Venkata Dheeraj Palur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Acronym : NSObject
@property (nonatomic, copy) NSString *fullForm;
@property (nonatomic, copy) NSString *since;
@property (nonatomic, copy) NSString *usageFrequency;

- (id)initWithAcronym:(NSString *) fullForm usedSince: (NSString *)since usageFrequency: (NSString *)frequency;
@end
