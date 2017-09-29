//
//  XMLContenShowView.m
//  FM
//
//  Created by home on 2017/9/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "XMLContenShowView.h"

@implementation XMLContenShowView


- (instancetype)init {
    
    if (self = [super init]) {
        
        [self setupUI];
    }
    
    return self;
}
-(void)setupUI {
    
    self.contentImageView.hidden = NO;
    
    self.coveView.alpha = 0.4;

    self.coveButton.hidden = NO;
}

- (UIImageView *)contentImageView {
    
    if (!_contentImageView) {
        _contentImageView  = [[UIImageView alloc] init];
        [self addSubview:_contentImageView];
        [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    return _contentImageView;
}

-(UIView *)coveView {
    
    if (!_coveView) {
        _coveView = [[UIView alloc] init];
        _coveView.backgroundColor = [UIColor blackColor];
        [_contentImageView addSubview:_coveView];
        [_coveView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(_contentImageView);
            make.height.mas_equalTo(20);
        }];
    }
    return _coveView;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        _contentLabel = [UILabel qp_labelWithText:@"" color:[UIColor blackColor] fontSize:13];
        [self.contentImageView addSubview:_contentLabel];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(3);
            make.bottom.right.mas_equalTo(0);
            make.height.mas_offset(20);
        }];
    }
    return _contentLabel;
    
}
- (UIButton *)coveButton {
    if (!_coveButton) {
        _coveButton = [[UIButton alloc] init];
        [self addSubview:_coveButton];
        [_coveButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        [_coveButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _coveButton;
}

- (void)buttonClick {
    if ([self.delegate respondsToSelector:@selector(contenShowViewClickatIndex:)]) {
        [self.delegate contenShowViewClickatIndex:self.tag];
    }
}


@end
