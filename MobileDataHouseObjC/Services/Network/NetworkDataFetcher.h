//
//  NetworkDataFetcher.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "../API/API.h"
#import "NetworkService.h"
#import "../../Model/Image.h"
#import "../API/APIParameters.h"
#import "../API/ServerResponse.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkDataFetcher : NSObject {
    NetworkService *networkService;
}

- (id)initWithNetworkService:(NetworkService *)networkService;
- (void)getPhotosWithUserQuery:(NSString *)query page:(NSString *)page success:(void(^)(NSMutableArray *))success failure:(void(^)(NSError *))failure;

@end

NS_ASSUME_NONNULL_END

