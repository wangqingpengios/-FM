//
//  XMLContenShowView.h
//  FM
//
//  Created by home on 2017/9/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContenShowViewDelegate <NSObject>
@optional
- (void)contenShowViewClickatIndex:(NSInteger)tag;
@end

@interface XMLContenShowView : UIView
/* 接收外界传过来的图 **/
@property (nonatomic, strong) UIImageView *contentImageView;
/* 蒙层 **/
@property (nonatomic, strong) UIView *coveView;
/* 蒙层文字 **/
@property (nonatomic, strong) UILabel *contentLabel;
/* 透明按钮-增加点击事件 **/
@property (nonatomic, strong) UIButton *coveButton;
/* 按钮点击事件 **/
@property (nonatomic, weak) id<ContenShowViewDelegate> delegate;

@end
