//
//  PhotosListCollectionViewController.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Custom Views/FooterView.h"
#import "../Cell/PhotosListCollectionViewCell.h"
#import "../../View Model/Cell/PhotosListCollectionViewCellViewModel.h"
#import "../../View Model/Controllers/PhotosListCollectionViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosListCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout> {
    FooterView *footerView;
}

@property (strong, nonatomic) PhotosListCollectionViewViewModel *photosListCollectionViewViewModel;

@end

NS_ASSUME_NONNULL_END
