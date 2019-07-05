//
//  PlayerListView.h
//  PlayerListDemo
//
//  Created by FoxDog on 2019/7/5.
//  Copyright © 2019 FoxDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataParseModel;
NS_ASSUME_NONNULL_BEGIN

@interface PlayerListView : UITableView

@property (nonatomic, weak) UIViewController *currentVC;

- (void)dataParse:(DataParseModel *)model;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style CurrentVC:(__weak UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
