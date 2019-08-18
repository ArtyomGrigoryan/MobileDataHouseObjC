//
//  PhotosListCollectionViewCell.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImage.h>
#import "../../View Model/Cell/PhotosListCollectionViewCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosListCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *smallImageView;
- (void)configureCell:(PhotosListCollectionViewCellViewModel *)collectionViewCellViewModel;

@end

NS_ASSUME_NONNULL_END
