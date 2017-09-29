//
//  XMLFindPutCell.m
//  FM
//
//  Created by home on 2017/9/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "XMLFindPutCell.h"
#import "XMLContenShowView.h"

@implementation XMLFindPutCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.leftContenShowView.hidden = NO;
    }
    return self;
}

- (XMLContenShowView *)leftContenShowView {
    
    if (!_leftContenShowView) {
        
        _leftContenShowView = [[XMLContenShowView alloc] init];
        [self.contentView addSubview:_leftContenShowView];
        [_leftContenShowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(KRect, KRect));
        }];
    }
    return _leftContenShowView;
}

- (XMLContenShowView *)centerContenShowView {
    
    if (!_centerContenShowView) {
        _centerContenShowView = [[XMLContenShowView alloc] init];
        [self.contentView addSubview:_centerContenShowView];
        [_centerContenShowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.equalTo(_leftContenShowView.mas_right).offset(10);
            make.size.equalTo(_leftContenShowView);
        }];
    }
    return _centerContenShowView;
}

- (XMLContenShowView *)rightContentShowView {
    
    if (!_rightContentShowView) {
        _rightContentShowView = [[XMLContenShowView alloc] init];
        [self.contentView addSubview:_rightContentShowView];
        [_rightContentShowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.equalTo(_centerContenShowView.mas_right).offset(10);
            make.size.equalTo(_leftContenShowView);
        }];
    }
    return _rightContentShowView;
}

- (UILabel *)leftDetailLabel {
    
    if (!_leftDetailLabel) {
        _leftDetailLabel = [UILabel qp_labelWithText:@"" color:[UIColor grayColor] fontSize:14];
        [self.contentView addSubview:_leftDetailLabel];
        _leftDetailLabel.numberOfLines =2;
        [_leftDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.equalTo(_leftContenShowView);
            make.trailingMargin.equalTo(_leftContenShowView);
            make.top.equalTo(_leftContenShowView.mas_bottom).offset(10);
        }];
    }
    return _leftDetailLabel;
}

- (UILabel *)centerDetailLabel {
    
    if (!_centerDetailLabel) {
        _centerDetailLabel = [UILabel qp_labelWithText:@"" color:[UIColor grayColor] fontSize:14];
        [self.contentView addSubview:_centerDetailLabel];
        _centerDetailLabel.numberOfLines = 2;
        [_centerDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.equalTo(_centerContenShowView);
            make.trailingMargin.equalTo(_centerContenShowView);
            make.top.equalTo(_centerContenShowView.mas_bottom).offset(10);
        }];
    }
    return _centerDetailLabel;
}

- (UILabel *)rightDetailLabel {
    
    if (!_rightDetailLabel) {
        _rightDetailLabel = [UILabel qp_labelWithText:@"" color:[UIColor grayColor] fontSize:14];
        [self.contentView addSubview:_rightDetailLabel];
        _rightDetailLabel.numberOfLines = 2;
        [_rightDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.equalTo(_rightContentShowView);
            make.trailingMargin.equalTo(_rightContentShowView);
            make.top.equalTo(_rightContentShowView.mas_bottom).offset(10);
        }];
    }
    return _rightDetailLabel;
}

@end
