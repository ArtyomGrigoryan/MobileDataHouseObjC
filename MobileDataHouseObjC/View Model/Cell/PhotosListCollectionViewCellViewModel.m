//
//  PhotosListCollectionViewCellViewModel.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "PhotosListCollectionViewCellViewModel.h"

@implementation PhotosListCollectionViewCellViewModel {
    Image *image;
}

- (id)initWithImage:(Image *)image {
    if(self = [super init]) {
        self->image = image;
    }
    return self;
}

- (NSString *)getImageSmallUrl {
    return self->image.small;
}

@end
