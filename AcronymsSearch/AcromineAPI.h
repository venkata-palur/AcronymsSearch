//
//  AcromineAPI.h
//  AcronymsSearch
//
//  Created by Venkata Dheeraj Palur on 2/9/16.
//  Copyright © 2016 Venkata Dheeraj Palur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcromineAPI : NSObject
+ (void)fetchAcronyms:(NSString *)acronym completion:(void (^)(BOOL success, id response, NSError *error)) completionHandler;
@end
