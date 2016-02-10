//
//  AcromineAPI.m
//  AcronymsSearch
//
//  Created by Venkata Dheeraj Palur on 2/9/16.
//  Copyright © 2016 Venkata Dheeraj Palur. All rights reserved.
//

#import "AcromineAPI.h"
#import "AFNetworking.h"

@implementation AcromineAPI

static NSString * const BaseURLString = @"http://www.nactem.ac.uk/software/acromine/";

+ (void) fetchAcronyms:(NSString *) acronym completion:(void (^)(BOOL success, id response, NSError *error)) completionHandler {
    NSURL *baseURL = [NSURL URLWithString: BaseURLString];
    NSDictionary *parameters = @{@"sf": acronym, @"lf": @""};
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [manager GET:@"dictionary.py" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSMutableArray *data = [NSMutableArray new];
        if ([responseObject count] > 0) {
            data = responseObject[0][@"lfs"][0][@"vars"];
//            NSString *acronymShortForm = responseObject[0][@"sf"];
//            NSLog(@"JSON: %@", acronymShortForm);
        }
        completionHandler(YES, data, nil);
        
        
    } failure: ^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
        completionHandler(NO, nil, error);
    }];
}

@end
