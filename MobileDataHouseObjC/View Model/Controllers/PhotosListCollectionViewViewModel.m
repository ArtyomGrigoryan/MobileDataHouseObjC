//
//  PhotosListCollectionViewViewModel.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "PhotosListCollectionViewViewModel.h"

@implementation PhotosListCollectionViewViewModel {
    NSInteger page;
    NSMutableArray *images;
    NetworkDataFetcher *fetcher;
}

// В конструкторе создадим и проинициализируем переменные для работы с сетью
- (id)initWithUserQuery:(NSString *)query {
    if(self = [super init]) {
        page = 1;
        _userQuery = query;
        NetworkService *networkService = [[NetworkService alloc] init];
        fetcher = [[NetworkDataFetcher alloc] initWithNetworkService:networkService];
    }
    return self;
}

// Качаем картинки по запросу, который хранится в переменной userQuery
- (void)fetchImages:(void (^)(void))success failure:(void (^)(void))failure {
    __weak __typeof(self)weakSelf = self;
    [fetcher getPhotosWithUserQuery:_userQuery page:@"1" success:^(NSMutableArray * _Nonnull data) {
        __typeof(self)strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf->images = data;
            success();
        }
    } failure:^(NSError * _Nonnull error) {
        __typeof(self)strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf->_error = error;
            failure();
        }
    }];
}

// Качаем новые картинки по тому же самому запросу с других страниц (пейджинг)
- (void)getNextPortion {
    page += 1;
    __weak __typeof(self)weakSelf = self;
    [fetcher getPhotosWithUserQuery:_userQuery page:[@(page) stringValue] success:^(NSMutableArray * _Nonnull data) {
        __typeof(self)strongSelf = weakSelf;
        if (strongSelf) {
            [strongSelf->images addObjectsFromArray:data];
            strongSelf->_getNextPage();
        }
    } failure:^(NSError * _Nonnull error) {
        __typeof(self)strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf->_error = error;
            strongSelf->_getNextPage();
        }
    }];
}

// Создаем view model для ячейки
- (PhotosListCollectionViewCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath {
    Image *image = self->images[indexPath.row];
    PhotosListCollectionViewCellViewModel *viewModel = [[PhotosListCollectionViewCellViewModel alloc] initWithImage:image];
    return viewModel;
}

// Сколько будет ячеек
- (NSInteger)numberOfItemsInSection {
    return (NSInteger) [self->images count];
}

@end
