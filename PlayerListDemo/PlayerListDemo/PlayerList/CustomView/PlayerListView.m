//
//  PlayerListView.m
//  PlayerListDemo
//
//  Created by FoxDog on 2019/7/5.
//  Copyright © 2019 FoxDog. All rights reserved.
//

#import "PlayerListView.h"
#import "PlayerListCell.h"
#import "PlayerManager.h"
#import "DataParseModel.h"

@interface PlayerListView ()

@property (nonatomic, strong) PlayerManager *manager;

@end

@implementation PlayerListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style CurrentVC:(__weak UIViewController *)vc
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.currentVC = vc;
        [self registerClass:PlayerListCell.class forCellReuseIdentifier:PLAYERCELLREUSEID];
        self.delegate = self.manager;
        self.dataSource = self.manager;
    }
    return self;
}

- (void)dataParse:(DataParseModel *)model
{
    [_manager setUrls:[NSMutableArray arrayWithArray:model.result]];
}

#pragma mark - lazy load
- (PlayerManager *)manager
{
    if (_manager == nil) {
        __weak typeof(PlayerListView *) weakSelf = self;
        _manager = [[PlayerManager alloc] initWithCurrentList:weakSelf CurrentVC:_currentVC];
    }
    return _manager;
}

@end
