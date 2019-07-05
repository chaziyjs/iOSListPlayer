//
//  PlayerManager.h
//  PlayerListDemo
//
//  Created by FoxDog on 2019/7/5.
//  Copyright © 2019 FoxDog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PlayerListCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerManager : NSObject<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, PlayerListCellDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIViewController *currentVC;
@property (nonatomic, strong) NSMutableArray *urls;

- (instancetype)initWithCurrentList:(__weak UITableView *)list CurrentVC:(__weak UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
