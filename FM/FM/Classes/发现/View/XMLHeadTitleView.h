//
//  XMLHeadTitleView.h
//  FM
//
//  Created by home on 2017/9/19.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLHeadTitleView : UIView

- (instancetype)initWithTitle:(NSString *)title hasMore:(BOOL)more;

@property (nonatomic, copy) NSString *titleLabelText;


/* 三角箭头 **/
@property (nonatomic, strong) UIImageView *arrowImageView;

/* 更多按钮 **/
@property (nonatomic, strong) UIButton *moreBtn;

@property (nonatomic, strong) UILabel *titleLabel;
@end
