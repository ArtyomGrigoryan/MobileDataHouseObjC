//
//  Image.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Services/API/ServerResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface Image : NSObject

@property (strong, nonatomic) NSString* small;

- (id)initWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
