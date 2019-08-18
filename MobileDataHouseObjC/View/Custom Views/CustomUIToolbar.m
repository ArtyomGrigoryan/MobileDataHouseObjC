//
//  CustomUIToolbar.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "CustomUIToolbar.h"

@implementation CustomUIToolbar

- (CustomUIToolbar *)initWithSelector:(SEL)selector {
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 416, 320, 44)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *actionButton = [[UIBarButtonItem alloc] initWithTitle:@"Готово" style:UIBarButtonItemStylePlain target:self action:selector];
    
    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpace, actionButton, nil]];
    
    return (CustomUIToolbar *) toolbar;
}

@end
