//
//  PhotosListCollectionViewCell.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "PhotosListCollectionViewCell.h"

@implementation PhotosListCollectionViewCell

- (void)configureCell:(PhotosListCollectionViewCellViewModel *)collectionViewCellViewModel {
    [_smallImageView sd_setImageWithURL:[NSURL URLWithString:[collectionViewCellViewModel getImageSmallUrl]]
                       placeholderImage:[UIImage imageNamed:@"imagePlaceHolder"]];
}

@end
