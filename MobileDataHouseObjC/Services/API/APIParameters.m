//
//  APIParameters.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "APIParameters.h"

@implementation APIParameters

+ (NSString *)query {
    return @"query";
}

+ (NSString *)page {
    return @"page";
}

+ (NSString *)clientId {
    return @"client_id";
}

+ (NSString *)perPage {
    return @"per_page";
}

@end
