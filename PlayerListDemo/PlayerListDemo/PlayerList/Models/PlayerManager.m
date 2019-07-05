//
//  PlayerManager.m
//  PlayerListDemo
//
//  Created by FoxDog on 2019/7/5.
//  Copyright © 2019 FoxDog. All rights reserved.
//

#import "PlayerManager.h"
#import <ZFPlayer/ZFPlayer.h>
#import <ZFPlayer/ZFAVPlayerManager.h>
#import <ZFPlayer/ZFPlayerControlView.h>
#import "DataParseModel.h"
#import <YYKit/YYKit.h>

@interface PlayerManager ()

@property (nonatomic, strong) ZFPlayerController *player;
@property (nonatomic, strong) ZFPlayerControlView *controlView;
@property (nonatomic, strong) NSMutableArray *videoURLS;

@end

@implementation PlayerManager

- (instancetype)initWithCurrentList:(__weak UITableView *)list CurrentVC:(__weak UIViewController *)vc
{
    self = [super init];
    if (self) {
        _videoURLS = [NSMutableArray array];
        _urls = [NSMutableArray array];
        
        _tableView = list;
        _currentVC = vc;
        
        ZFAVPlayerManager *playerManager = [[ZFAVPlayerManager alloc] init];
        
        /// player的tag值必须在cell里设置
        self.player = [ZFPlayerController playerWithScrollView:self.tableView playerManager:playerManager containerViewTag:1000];
        self.player.controlView = self.controlView;
        self.player.shouldAutoPlay = NO;
        /// 1.0是完全消失的时候
        self.player.playerDisapperaPercent = 1.0;
        
        @weakify(self)
        self.player.orientationWillChange = ^(ZFPlayerController * _Nonnull player, BOOL isFullScreen) {
            @strongify(self)
            [self.currentVC setNeedsStatusBarAppearanceUpdate];
            [UIViewController attemptRotationToDeviceOrientation];
            self.tableView.scrollsToTop = !isFullScreen;
        };
        
        self.player.playerDidToEnd = ^(id  _Nonnull asset) {
            @strongify(self)
            [self.player stopCurrentPlayingCell];
        };
    }
    return self;
}

- (void)setUrls:(NSMutableArray *)urls
{
    _urls = [urls mutableCopy];
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

- (void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    @weakify(self)
    [tableView zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
        @strongify(self)
        if (self.urls.count > indexPath.row) {
            [self playTheVideoWithModel:self.urls[indexPath.row] scrollToTop:NO];
        }
    }];
}

#pragma mark - UIScrollViewDelegate 列表播放必须实现

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewDidEndDecelerating];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [scrollView zf_scrollViewDidEndDraggingWillDecelerate:decelerate];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewDidScrollToTop];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewDidScroll];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [scrollView zf_scrollViewWillBeginDragging];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _urls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DataInfoModel *model = _urls[indexPath.row];
    if (model.itemType == 4) {
        PlayerListCell *cell = [tableView dequeueReusableCellWithIdentifier:PLAYERCELLREUSEID];
        cell.delegate = self;
        [cell setModel:model];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class)];
        if (cell == nil) {
            UITableViewCellStyle style = UITableViewCellStyleDefault;
            switch (model.itemType) {
                case 1:
                {
                    style = UITableViewCellStyleSubtitle;
                } break;
                case 2:
                {
                    style = UITableViewCellStyleValue2;
                } break;
                case 3:
                {
                    style = UITableViewCellStyleValue1;
                } break;
                default:
                    break;
            }
            cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:NSStringFromClass(UITableViewCell.class)];
            cell.textLabel.text = [NSString stringWithFormat:@"%@\n%@", model.titel, model.content];
            cell.detailTextLabel.text = model.nickName;
            if (model.itemType == 3) {
                [cell.imageView setImageWithURL:[NSURL URLWithString:model.icon] options:YYWebImageOptionShowNetworkActivity];
            } else {
                [cell.imageView setImageWithURL:[NSURL URLWithString:model.mainImg] options:YYWebImageOptionShowNetworkActivity];
            }
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /// 如果正在播放的index和当前点击的index不同，则停止当前播放的index
    if (self.player.playingIndexPath != indexPath) {
        [self.player stopCurrentPlayingCell];
    }
    /// 如果没有播放，则点击进详情页会自动播放
    if ([[tableView cellForRowAtIndexPath:indexPath] isKindOfClass:PlayerListCell.class]) {
        if (!self.player.currentPlayerManager.isPlaying) {
            [self playTheVideoWithModel:_urls[indexPath.row] scrollToTop:NO];
        }
        NSLog(@"点击了有视频的CELL");
    } else {
        NSLog(@"点击了其他CELL");
    }
    
    
    /// 到详情页
//    ZFPlayerDetailViewController *detailVC = [ZFPlayerDetailViewController new];
//    detailVC.player = self.player;
//    @weakify(self)
//    /// 详情页返回的回调
//    detailVC.detailVCPopCallback = ^{
//        @strongify(self)
//        if (self.player.currentPlayerManager.playState == ZFPlayerPlayStatePlayStopped) {
//            [self.player stopCurrentPlayingCell];
//        } else {
//            [self.player updateScrollViewPlayerToCell];
//        }
//    };
    /// 详情页点击播放的回调
//    detailVC.detailVCPlayCallback = ^{
//        @strongify(self)
//        [self zf_playTheVideoAtIndexPath:indexPath];
//    };
//    [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DataInfoModel *layout = self.urls[indexPath.row];
    return layout.height;
}

#pragma mark - PlayerListCellDelegate
- (void)playerListCellNeedToPlayVideoWithModel:(DataInfoModel *)model
{
    [self playTheVideoWithModel:model scrollToTop:NO];
}

- (void)playTheVideoWithModel:(DataInfoModel *)model scrollToTop:(BOOL)scrollToTop {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_urls indexOfObject:model] inSection:0];
    [self.player playTheIndexPath:indexPath assetURL:[NSURL URLWithString:model.courseURL] scrollToTop:scrollToTop];
    [self.controlView showTitle:model.titel
                 coverURLString:model.mainImg
                 fullScreenMode:ZFFullScreenModePortrait];
}


#pragma mark - lazy load
- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [ZFPlayerControlView new];
    }
    return _controlView;
}

@end
