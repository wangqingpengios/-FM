//
//  XMLHeadTitleView.m
//  FM
//
//  Created by home on 2017/9/19.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "XMLHeadTitleView.h"

@interface XMLHeadTitleView ()


@end

@implementation XMLHeadTitleView


- (instancetype)initWithTitle:(NSString *)title hasMore:(BOOL)more {
    
    if (self = [super init]) {
        
        self.titleLabelText = title;
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.arrowImageView.image = [UIImage imageNamed:@"tabbar_np_play"];
        
        [self.titleLabel setTextColor:[UIColor blackColor]];
        
        if (more) {
            
            [self.moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        }
        
        
    }
    
    return self;
}

- (UIImageView *)arrowImageView {

    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        [self addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(8);
            make.bottom.mas_equalTo(-12);
            make.size.mas_equalTo(10);
        }];
    }
    return _arrowImageView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [UILabel qp_labelWithText:_titleLabelText color:[UIColor blackColor] fontSize:13];
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_arrowImageView.mas_right).offset(4);
            make.centerY.equalTo(_arrowImageView);
            make.width.mas_equalTo(150);
        }];
    }
    return _titleLabel;
}

- (UIButton *)moreBtn {
    
    if (!_moreBtn) {
        _moreBtn = [UIButton qp_textButton:nil fontSize:13 normalColor:[UIColor blackColor] selectedColor:nil normalImage:nil selectedImage:nil];
        [self addSubview:_moreBtn];
        
        [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-5);
            make.centerY.equalTo(_titleLabel);
            make.size.mas_equalTo(CGSizeMake(60, 20));
        }];
        _moreBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [_moreBtn setImage:[UIImage imageNamed:@"cell_arrow"] forState:UIControlStateNormal];
    }
    return _moreBtn;
}

@end
