//
//  PhotosListCollectionViewCellViewModel.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "../../Model/Image.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotosListCollectionViewCellViewModel : NSObject {
    Image *image;
}

- (NSString *)getImageSmallUrl;
- (id)initWithImage:(Image *)image;

@end

NS_ASSUME_NONNULL_END