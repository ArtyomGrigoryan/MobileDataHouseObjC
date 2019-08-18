//
//  MainViewViewModel.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotosListCollectionViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ViewModelDelegate

- (void)isCanSubmit:(BOOL)status;

@end

@interface MainViewViewModel : NSObject

@property (strong, nonatomic) NSString *userQuery;
@property (weak, nonatomic) id <ViewModelDelegate> delegate;

- (PhotosListCollectionViewViewModel *)getPhotosListCollectionViewViewModelForUserEnteredRequest;

@end

NS_ASSUME_NONNULL_END
