//
//  DataParseModel.h
//  PlayerListDemo
//
//  Created by FoxDog on 2019/7/5.
//  Copyright © 2019 FoxDog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYKit/NSObject+YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataInfoModel : NSObject

@property (nonatomic, assign) NSUInteger itemType;
@property (nonatomic, assign) NSUInteger itemID;
@property (nonatomic, copy) NSString *titel;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *mainImg;
@property (nonatomic, assign) NSUInteger adID;
@property (nonatomic, copy) NSString *courseURL;
@property (nonatomic, assign) NSUInteger courseID;
@property (nonatomic, assign) NSUInteger height;


@end

@interface DataParseModel : NSObject

@property (nonatomic, copy) NSArray *result;


@end

NS_ASSUME_NONNULL_END
