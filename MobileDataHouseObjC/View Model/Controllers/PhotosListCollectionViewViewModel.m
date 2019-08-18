//
//  PhotosListCollectionViewViewModel.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "PhotosListCollectionViewViewModel.h"

@implementation PhotosListCollectionViewViewModel

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
- (void)fetchImages:(void (^)(void))success failure:(void (^)(NSError * _Nonnull))failure {
    [fetcher getPhotosWithUserQuery:_userQuery page:@"1" success:^(NSMutableArray * _Nonnull data) {
        self->images = data;
        success();
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

// Качаем новые картинки по тому же самому запросу с других страниц (пейджинг)
- (void)getNextPortion {
    page += 1;
    [fetcher getPhotosWithUserQuery:_userQuery page:[@(page) stringValue] success:^(NSMutableArray * _Nonnull data) {
        [self->images addObjectsFromArray:data];
        self->_getNextPage(nil);
    } failure:^(NSError * _Nonnull error) {
        self->_getNextPage(error);
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
