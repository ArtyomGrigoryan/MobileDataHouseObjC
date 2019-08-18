//
//  API.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "API.h"

@implementation API

+ (NSString *)scheme {
    return @"https";
}

+ (NSString *)host {
    return @"api.unsplash.com";
}

+ (NSString *)searchPhotos {
    return @"/search/photos/";
}

+ (NSString *)perPage {
    return @"50";
}

+ (NSString *)key {
    return @"d73708d9bea34f6607bf3bb7d9c08739c5257aa3f9bdb4e3245aeb9f1b5172b0";
}

@end
