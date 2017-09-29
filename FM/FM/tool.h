//
//  tool.h
//  FM
//
//  Created by home on 2017/8/21.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#ifndef tool_h
#define tool_h

#define kHomeURLPath @"http://mobile.ximalaya.com/mobile/discovery/v1/recommends"
#define kCategoryURLPath @"http://mobile.ximalaya.com/mobile/discovery/v1/categories"
#define kNickURLPath @"http://mobile.ximalaya.com/m/explore_user_index"
#define kRankURLPath @"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group"
#define kLiveURLPath @"http://live.ximalaya.com/live-web/v1/getHomePageRadiosList"

#define kURLVersion @"version":@"4.3.26.2"
#define kURLDevice @"device":@"ios"
#define kURLSpecial @"includeSpecial":@"true"
#define kURLActivity @"includeActivity":@"true"
#define kURLScale @"scale":@2
#define kURLPage @"page":@1
#define kURLPicVersion @"picVersion":@11
#define KURLChannel @"channel":@"and-f5"   // 会变 貌似不影响




#pragma mark - 屏幕相关
#define KScreenH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define KScreenW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度


//自定义长方形按钮宽
#define KRect (KScreenW - 40)/3

#endif /* tool_h */
