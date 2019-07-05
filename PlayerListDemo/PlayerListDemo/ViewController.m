//
//  ViewController.m
//  PlayerListDemo
//
//  Created by FoxDog on 2019/7/5.
//  Copyright © 2019 FoxDog. All rights reserved.
//

#import "ViewController.h"
#import "PlayerList/CustomView/PlayerListView.h"
#import "DataParseModel.h"

@interface ViewController ()

@property (nonatomic, strong) PlayerListView *mainListView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.mainListView];
    NSDictionary *dataInfo = @{
                               @"result" : @[
                                       @{
                                           @"itemType" : @(1),
                                           @"itemID" : @(37189),
                                           @"titel" : @"这是一条新闻标题",
                                           @"content" : @"新闻内容新闻内容新闻内容新闻内容新闻内容",
                                           @"nickName" : @"新闻君",
                                           @"icon" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562323553905&di=b23e8ac58a7bb5e352a1bc14dcf60de1&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201503%2F28%2F20150328195759_zFcCk.jpeg",
                                           @"height" : @(150)
                                           },
                                       @{
                                           @"itemType" : @(4),
                                           @"itemID" : @(343125),
                                           @"titel" : @"这是课程标题",
                                           @"content" : @"数学语文化学物理,数学语文化学物理,数学语文化学物理",
                                           @"nickName" : @"教师君",
                                           @"courseID" : @(37894),
                                           @"courseURL" : @"http://tb-video.bdstatic.com/tieba-smallvideo-transcode/20985849_722f981a5ce0fc6d2a5a4f40cb0327a5_3.mp4",
                                           @"mainImg" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562919858&di=6622560a624f2361745f4c86efb22f03&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsa.baidu.com%2Fexp%2Fw%3D500%2Fsign%3D86882e6c5f3d26972ed3085d65fab24f%2Fc8ea15ce36d3d53990641c653487e950352ab03e.jpg",
                                           @"icon" : @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3641180745,3464596675&fm=26&gp=0.jpg",
                                           @"height" : @(200)
                                           },
                                       @{
                                           @"itemType" : @(2),
                                           @"itemID" : @(8901),
                                           @"titel" : @"这是一条广告标题",
                                           @"adID" : @(53412879),
                                           @"mainImg" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562323622053&di=11e16fecdd5a178215ef62d77e708381&imgtype=0&src=http%3A%2F%2Fvdposter.bdstatic.com%2F5d4431333e9094a620372eb93aa3c81c.jpeg",
                                           @"height" : @(60)
                                           },
                                       @{
                                           @"itemType" : @(3),
                                           @"itemID" : @(4531),
                                           @"titel" : @"这是一条文章标题",
                                           @"content" : @"就爱独守空房将按时发达快乐十分了阿卡丽时代峰峻爱哦速发京东数科按时阿萨德飞机啊快乐十分房间爱的克里斯风机房监控",
                                           @"nickName" : @"作者君",
                                           @"icon" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562918520&di=41edfb13ba37bc1a301e0f6e6d3aaf70&imgtype=jpg&er=1&src=http%3A%2F%2Fimg4q.duitang.com%2Fuploads%2Fitem%2F201412%2F08%2F20141208030156_ju2im.jpeg",
                                           @"height" : @(100)
                                           },
                                       @{
                                           @"itemType" : @(1),
                                           @"itemID" : @(563546),
                                           @"titel" : @"这是一条新的新闻标题",
                                           @"content" : @"新闻内容新闻内容新闻内容新闻内容新闻内容",
                                           @"nickName" : @"新闻君2号",
                                           @"icon" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562323800799&di=27035822bf8dd8513c6841958f329769&imgtype=0&src=http%3A%2F%2Fwww.52hrttpic.com%2Fimage%2FTOPHRTT%2F201903%2F03%2FD1551318785376.jpeg%3F200x200",
                                           @"height" : @(80)
                                           },
                                       @{
                                           @"itemType" : @(4),
                                           @"itemID" : @(54735341),
                                           @"titel" : @"这是空空老师的新课程",
                                           @"content" : @"空空老师好技教学巧空空老师好技巧空空老师好技巧空空老师好技巧空空老师好技巧教学",
                                           @"nickName" : @"空空老师",
                                           @"courseID" : @(453124),
                                           @"courseURL" : @"http://tb-video.bdstatic.com/tieba-video/15_dc76d5a63817ebc2f08e5f323d67b753.mp4",
                                           @"mainImg" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562919826&di=123a370ee342e2db3a12b59403f3d8bb&imgtype=jpg&er=1&src=http%3A%2F%2Fn.sinaimg.cn%2Fent%2Ftransform%2F21%2Fw545h276%2F20190627%2F0a25-hyzpvir6565087.png",
                                           @"icon" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562323800798&di=99a064431a2e8927db7c4baa216ba68d&imgtype=0&src=http%3A%2F%2Fpicc.iqshw.com%2Fd%2Ffile%2Fwzgdq%2Ftx%2F2019%2F07%2F04%2F2c4ec1234d3c8bafc62b1e598faac706.jpg",
                                           @"height" : @(200)
                                           },
                                       @{
                                           @"itemType" : @(4),
                                           @"itemID" : @(85462),
                                           @"titel" : @"这是小野老师的录播课",
                                           @"content" : @"小野老师贼野小野老师贼野小野老师贼野小野老师贼野小野老师贼野小野老师贼野小野老师贼野",
                                           @"nickName" : @"小野君",
                                           @"courseID" : @(6345),
                                           @"courseURL" : @"http://tb-video.bdstatic.com/videocp/823173_091d3d8433a802fa74eaad26fc4fe909.mp4",
                                           @"mainImg" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562323800798&di=2cab0cfac63a5e1e3d5d469d7c17db46&imgtype=0&src=http%3A%2F%2Fimgsa.baidu.com%2Fexp%2Fw%3D500%2Fsign%3Df08d1f3f825494ee87220f191df4e0e1%2Fd0c8a786c9177f3e645a628d7ecf3bc79e3d56c7.jpg",
                                           @"icon" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562323800797&di=bc71861f5e7ed2366d4fc38362e10d22&imgtype=0&src=http%3A%2F%2Fimgnews.mumayi.com%2Ffile%2F2019%2F07%2F04%2F11123783f886228bf1e13b2bc6c6cd45.jpg",
                                           @"height" : @(200)
                                           }
                                       ]
                               };
    DataParseModel *parseModel = [DataParseModel modelWithDictionary:dataInfo];
    [self.mainListView dataParse:parseModel];
}

#pragma mark - lazy laod
- (PlayerListView *)mainListView
{
    if (_mainListView == nil) {
        __weak typeof(UIViewController *) weakSelf = self;
        _mainListView = [[PlayerListView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain CurrentVC:weakSelf];
    }
    return _mainListView;
}

@end
