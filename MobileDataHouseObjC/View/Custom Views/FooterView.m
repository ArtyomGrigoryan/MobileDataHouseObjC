//
//  FooterView.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView

- (id)init {
    if (self = [super initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width, 0)]) {
        self.loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.loader.translatesAutoresizingMaskIntoConstraints = NO;
        self.loader.color = [UIColor redColor];
        self.loader.hidesWhenStopped = YES;
        
        [self addSubview:self.loader];
        
        [self.loader.topAnchor constraintEqualToAnchor:self.topAnchor constant:8].active = YES;
        [self.loader.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10].active = YES;
        [self.loader.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10].active = YES;
    }
    return self;
}

- (void)showLoader {
    [self.loader startAnimating];
}

- (void)hideLoader {
    [self.loader stopAnimating];
}

@end
