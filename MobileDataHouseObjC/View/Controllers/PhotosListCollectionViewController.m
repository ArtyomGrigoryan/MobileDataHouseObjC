//
//  PhotosListCollectionViewController.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "PhotosListCollectionViewController.h"

@implementation PhotosListCollectionViewController {
    FooterView *footerView;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
   
    footerView = [[FooterView alloc] init];
    
    NSString *tryAgainErrorMessage = @"Повторите попытку.";
    
    [self.collectionView registerClass:FooterView.class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter     withReuseIdentifier:NSStringFromClass([FooterView class])];
    
    __weak __typeof(self)weakSelf = self;
    
    [_photosListCollectionViewViewModel fetchImages:^{
        __typeof(self)strongSelf = weakSelf;
        if (strongSelf)
            [strongSelf.collectionView reloadData];
    } failure:^{
        __typeof(self)strongSelf = weakSelf;
        if (strongSelf)
            [strongSelf showAlertWithTitle:strongSelf->_photosListCollectionViewViewModel.error.localizedDescription message:tryAgainErrorMessage];
    }];
 
    _photosListCollectionViewViewModel.getNextPage = ^{
        __typeof(self)strongSelf = weakSelf;
        if (strongSelf) {
            if (nil == strongSelf->_photosListCollectionViewViewModel.error) {
                [strongSelf.collectionView reloadData];
            } else {
                [strongSelf showAlertWithTitle:strongSelf->_photosListCollectionViewViewModel.error.localizedDescription message:tryAgainErrorMessage];
            }
            [strongSelf->footerView hideLoader];
        }
    };
}

#pragma mark - UIScrollView

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.contentOffset.y > scrollView.contentSize.height / 1.9) {
        [self->footerView showLoader];
        [_photosListCollectionViewViewModel getNextPortion];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_photosListCollectionViewViewModel numberOfItemsInSection];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotosListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PhotosListCollectionViewCell class]) forIndexPath:indexPath];
    
    PhotosListCollectionViewCellViewModel *cellViewModel = [_photosListCollectionViewViewModel cellViewModelForIndexPath:indexPath];

    [cell configureCell:cellViewModel];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([FooterView class]) forIndexPath:indexPath];
    
    [reusableView addSubview:footerView];
    
    return reusableView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat xInsets = 10;
    CGFloat cellSpacing = 5;
    CGFloat numberOfColumns = 3;
    CGFloat width = collectionView.frame.size.width;
    
    return CGSizeMake((width / numberOfColumns) - (xInsets + cellSpacing), (width / numberOfColumns) - (xInsets + cellSpacing));
}

#pragma mark - IBAction

- (IBAction)clearCacheBarButtonItemPressed:(UIBarButtonItem *)sender {
    __weak __typeof(self)weakSelf = self;
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        __typeof(self)strongSelf = weakSelf;
        if (strongSelf)
            [strongSelf showAlertWithTitle:@"Кэш очищен!" message:nil];
    }];
}

#pragma mark - Helpers

- (void)showAlertWithTitle:(NSString *) title message: (NSString *) message {
    NSString *actionMessage = @"OK";
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okay = [UIAlertAction actionWithTitle:actionMessage style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    
    [ac addAction:okay];
    
    [self presentViewController:ac animated:YES completion:nil];
}

@end
