//
//  NetworkService.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "NetworkService.h"

@implementation NetworkService

- (void)requestWithPath:(NSString *)path params:(NSMutableDictionary *)params success:(void (^)(NSData * _Nonnull data))success failure:(void (^)(NSError * _Nonnull error))failure {
    NSURL *url = [self urlFromPath:path params:params];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [self createDataTaskWithSession:session url:url success:success failure:failure];
    
    [task resume];
}

- (NSURLSessionDataTask *)createDataTaskWithSession:(NSURLSession *)session url: (NSURL *)url success:(void (^)(NSData *))success failure:(void (^)(NSError *))failure {
    return [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (nil == error) {
                success(data);
            } else {
                failure(error);
            }
        });
    }];
}

- (NSURL *)urlFromPath:(NSString *)path params:(NSMutableDictionary *)params {
    NSURLComponents *components = [[NSURLComponents alloc] init];
    components.scheme = API.scheme;
    components.host = API.host;
    components.path = path;
    
    NSMutableArray *queryItems = [NSMutableArray array];
    
    [params enumerateKeysAndObjectsUsingBlock:^(NSString *name, NSString *value, BOOL *stop) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:name
                                                          value:[value stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet]]];
    }];
    
    components.queryItems = queryItems;
    
    return components.URL;
}

@end
