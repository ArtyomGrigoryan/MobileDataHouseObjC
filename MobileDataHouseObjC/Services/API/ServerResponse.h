//
//  ServerResponse.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServerResponse : NSObject

+ (NSString *)results;
+ (NSString *)urls;
+ (NSString *)small;

@end

NS_ASSUME_NONNULL_END
