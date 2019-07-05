//
//  PlayerListCell.m
//  PlayerListDemo
//
//  Created by FoxDog on 2019/7/5.
//  Copyright © 2019 FoxDog. All rights reserved.
//

#import "PlayerListCell.h"
#import "DataParseModel.h"
#import <YYKit/YYKit.h>

@interface PlayerListCell ()

@property (nonatomic, strong) UIImageView *headerIcon;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *videoThumb;
@property (nonatomic, strong) UIButton *playButton;

@end

@implementation PlayerListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headerIcon];
        [self.contentView addSubview:self.nickNameLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.videoThumb];
        [self.videoThumb addSubview:self.playButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _headerIcon.frame = CGRectMake(8.f, 8.f, 24.f, 24.f);
    _nickNameLabel.bounds = CGRectMake(0, 0, 100.f, 15.f);
    _nickNameLabel.center = CGPointMake(CGRectGetMaxX(_headerIcon.frame) + 60.f, _headerIcon.center.y);
    
    _titleLabel.frame = CGRectMake(8.f, CGRectGetMaxY(_headerIcon.frame) + 10.f, CGRectGetWidth(self.frame) - 16.f, 17.f);
    _videoThumb.frame = CGRectMake(8.f, CGRectGetMaxY(_titleLabel.frame) + 10.f, CGRectGetWidth(self.frame) - 16.f, 120.f);
    _playButton.bounds = CGRectMake(0, 0, 40.f, 40.f);
    _playButton.center = CGPointMake(CGRectGetWidth(_videoThumb.frame) * 0.5, CGRectGetHeight(_videoThumb.frame) * 0.5);
}

- (void)setModel:(DataInfoModel *)model
{
    _model = model;
    [_headerIcon setImageWithURL:[NSURL URLWithString:model.icon] options:YYWebImageOptionShowNetworkActivity];
    [_nickNameLabel setText:model.nickName];
    [_titleLabel setText:model.titel];
    [_videoThumb setImageWithURL:[NSURL URLWithString:model.mainImg] options:YYWebImageOptionShowNetworkActivity];
}

#pragma mark - 播放键开关
- (void)videoPlayAction
{
    if (_delegate && [_delegate respondsToSelector:@selector(playerListCellNeedToPlayVideoWithModel:)]) {
        [_delegate playerListCellNeedToPlayVideoWithModel:_model];
    }
}

#pragma mark - lazy load
- (UIImageView *)headerIcon
{
    if (_headerIcon == nil) {
        _headerIcon = [UIImageView new];
        _headerIcon.backgroundColor = UIColor.redColor;
    }
    return _headerIcon;
}

- (UILabel *)nickNameLabel
{
    if (_nickNameLabel == nil) {
        _nickNameLabel = [UILabel new];
        _nickNameLabel.font = [UIFont systemFontOfSize:13.f];
    }
    return _nickNameLabel;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:15.f];
    }
    return _titleLabel;
}

- (UIImageView *)videoThumb
{
    if (_videoThumb == nil) {
        _videoThumb = [UIImageView new];
        _videoThumb.backgroundColor = UIColor.lightGrayColor;
        _videoThumb.contentMode = UIViewContentModeScaleAspectFill;
        _videoThumb.clipsToBounds = YES;
        _videoThumb.userInteractionEnabled = YES;
        _videoThumb.tag = 1000;
    }
    return _videoThumb;
}

- (UIButton *)playButton
{
    if (_playButton == nil) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playButton setBackgroundColor:UIColor.whiteColor];
        [_playButton addTarget:self action:@selector(videoPlayAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playButton;
}

@end
