//
//  PlayerListCell.h
//  PlayerListDemo
//
//  Created by FoxDog on 2019/7/5.
//  Copyright © 2019 FoxDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataInfoModel;
NS_ASSUME_NONNULL_BEGIN

static NSString *PLAYERCELLREUSEID = @"PLAYERCELLREUSEID";

@protocol PlayerListCellDelegate <NSObject>

- (void)playerListCellNeedToPlayVideoWithModel:(DataInfoModel *)model;

@end

@interface PlayerListCell : UITableViewCell

@property (nonatomic, weak) id<PlayerListCellDelegate> delegate;
@property (nonatomic, strong) DataInfoModel *model;

@end

NS_ASSUME_NONNULL_END
