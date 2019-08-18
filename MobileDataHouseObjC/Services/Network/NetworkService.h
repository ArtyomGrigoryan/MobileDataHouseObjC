//
//  NetworkService.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "../API/API.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

- (void)requestWithPath:(NSString *)path params:(NSMutableDictionary *)params success:(void(^)(NSData *))success failure:(void(^)(NSError *))failure;

@end

NS_ASSUME_NONNULL_END
