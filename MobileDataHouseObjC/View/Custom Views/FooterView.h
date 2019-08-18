//
//  FooterView.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FooterView : UICollectionReusableView

@property (strong, nonatomic) UIActivityIndicatorView *loader;

- (void)showLoader;
- (void)hideLoader;

@end

NS_ASSUME_NONNULL_END
