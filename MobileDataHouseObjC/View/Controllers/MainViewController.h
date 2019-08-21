//
//  MainViewController.h
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "../Custom Views/CustomUIToolbar.h"
#import "PhotosListCollectionViewController.h"
#import "../../View Model/Controllers/MainViewViewModel.h"
#import "../../View Model/Controllers/PhotosListCollectionViewViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <ViewModelDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userQueryTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

NS_ASSUME_NONNULL_END
