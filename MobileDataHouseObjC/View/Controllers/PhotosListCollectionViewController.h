//
//  PhotosListCollectionViewController.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "../Custom Views/FooterView.h"
#import "../Cell/PhotosListCollectionViewCell.h"
#import "../../View Model/Controllers/PhotosListCollectionViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosListCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) PhotosListCollectionViewViewModel *photosListCollectionViewViewModel;

@end

NS_ASSUME_NONNULL_END
