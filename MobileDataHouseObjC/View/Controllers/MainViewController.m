//
//  MainViewController.m
//  MobileDataHouseObjC
//
//  Created by Артем Григорян on 18/08/2019.
//  Copyright © 2019 Artyom Grigoryan. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mainViewViewModel = [[MainViewViewModel alloc] init];
    mainViewViewModel.delegate = self;
    
    SEL hideKeyboard = sel_registerName("hideKeyboard");
    
    CustomUIToolbar *toolbar = [[CustomUIToolbar alloc] initWithSelector:hideKeyboard];
    
    _userQueryTextField.inputAccessoryView = toolbar;
    [_userQueryTextField addTarget:self action:@selector(myHandler:) forControlEvents:UIControlEventEditingChanged];
}

- (void)viewDidAppear:(BOOL)animated {
    SEL kbDidShow = sel_registerName("kbDidShow:");
    SEL kbDidHide = sel_registerName("kbDidHide:");
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:kbDidShow name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:kbDidHide name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PhotosListSegue"]) {
        PhotosListCollectionViewController *vc = segue.destinationViewController;
        vc.photosListCollectionViewViewModel = [mainViewViewModel getPhotosListCollectionViewViewModelForUserEnteredRequest];
        vc.title = mainViewViewModel.userQuery;
    }
}

#pragma mark - User interaction

- (void)myHandler:(UITextField *)textField {
    mainViewViewModel.userQuery = textField.text;
}

- (void)isCanSubmit:(BOOL)status {
    _submitButton.enabled = status;
}

#pragma mark - Keyboard

- (void)kbDidShow:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGRect kbRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbRect.size.height, 0.0);
    
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    [self.scrollView scrollRectToVisible: _userQueryTextField.frame animated:YES];
    
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)kbDidHide:(NSNotification *)notification {
    self.scrollView.contentInset = UIEdgeInsetsZero;
    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

@end
