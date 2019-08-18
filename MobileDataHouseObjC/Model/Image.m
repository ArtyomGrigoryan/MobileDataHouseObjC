//
//  Image.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "Image.h"

@implementation Image

- (id)initWithDictionary:(NSDictionary *)dict {
    if(self = [super init]) {
        self->_small = dict[ServerResponse.urls][ServerResponse.small];
    }
    return self;
}

@end
