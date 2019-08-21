//
//  PhotosListCollectionViewViewModel.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import <UIKit/UIkit.h>
#import "../../Services/Network/NetworkDataFetcher.h"
#import "../Cell/PhotosListCollectionViewCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosListCollectionViewViewModel : NSObject

typedef void (^CompletionBlock)(void);

@property (strong, nonatomic) NSError *error;
@property (strong, nonatomic) NSString *userQuery;
@property (copy, nonatomic) CompletionBlock getNextPage;

- (void)getNextPortion;
- (NSInteger)numberOfItemsInSection;
- (id)initWithUserQuery:(NSString *)query;
- (void)fetchImages:(void(^)(void))success failure:(void(^)(void))failure;
- (PhotosListCollectionViewCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
