//
//  MainViewViewModel.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "MainViewViewModel.h"

@implementation MainViewViewModel

// Переопределяем сеттер
- (void)setUserQuery:(NSString *)query {
    _userQuery = [self formatString:query];
    [_delegate isCanSubmit:[self isCanSubmit]];
}

// Убираем пробелы со строки
- (NSString *)formatString:(NSString *)query {
    NSString *stringWithoutSpaces = [query stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return stringWithoutSpaces;
}

// Проверяем есть ли в строке какой-нибудь символ
- (BOOL)isCanSubmit {
    return ([_userQuery length] > 0) ? YES : NO;
}

// Создаем и инициализируем пользовательским запросом View Model для следующего контроллера
- (PhotosListCollectionViewViewModel *)getPhotosListCollectionViewViewModelForUserEnteredRequest {
    return [[PhotosListCollectionViewViewModel alloc] initWithUserQuery:_userQuery];
}

@end
