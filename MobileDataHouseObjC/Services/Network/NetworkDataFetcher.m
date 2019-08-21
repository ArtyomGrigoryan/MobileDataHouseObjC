//
//  NetworkDataFetcher.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "NetworkDataFetcher.h"

@implementation NetworkDataFetcher {
    NetworkService *networkService;
}

- (id)initWithNetworkService:(NetworkService *)networkService {
    if(self = [super init]) {
        self->networkService = networkService;
    }
    return self;
}

- (void)getPhotosWithUserQuery:(NSString *)query page:(NSString *)page success:(void(^)(NSMutableArray *))success failure:(void(^)(NSError *))failure {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:API.perPage forKey:APIParameters.perPage];
    [params setObject:API.key forKey:APIParameters.clientId];
    [params setObject:query forKey:APIParameters.query];
    [params setObject:page forKey:APIParameters.page];
    
    [networkService requestWithPath:API.searchPhotos params:params success:^(NSData * _Nonnull data) {
        NSError *err = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
        if (nil == err) {
            NSArray *results = [json objectForKey:ServerResponse.results];
            NSMutableArray *images = [NSMutableArray array];
            
            for (NSDictionary *dict in results) {
                Image *image = [[Image alloc] initWithDictionary:dict];
                [images addObject:image];
            }
            
            success(images);
        } else {
            failure(err);
        }
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
