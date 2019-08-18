//
//  PhotosListCollectionViewViewModel.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import <UIKit/UIkit.h>
#import <Foundation/Foundation.h>
#import "../../Services/Network/NetworkDataFetcher.h"
#import "../Cell/PhotosListCollectionViewCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosListCollectionViewViewModel : NSObject {
    NSInteger page;
    NSMutableArray *images;
    NetworkDataFetcher *fetcher;
}

typedef void (^CompletionBlock)(NSError * _Nullable error);

@property (strong, nonatomic) NSString *userQuery;
@property (copy, nonatomic) CompletionBlock getNextPage;

- (void)getNextPortion;
- (NSInteger)numberOfItemsInSection;
- (id)initWithUserQuery:(NSString *)query;
- (void)fetchImages:(void(^)(void))success failure:(void(^)(NSError *))failure;
- (PhotosListCollectionViewCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
