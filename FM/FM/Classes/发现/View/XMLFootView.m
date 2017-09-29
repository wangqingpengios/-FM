//
//  XMLFootView.m
//  FM
//
//  Created by home on 2017/9/22.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "XMLFootView.h"

@implementation XMLFootView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    self.moreButton = [[UIButton alloc] init];
    
    [self addSubview:self.moreButton];
    
    [self.moreButton setTitle:@"换一批" forState:UIControlStateNormal];
    
    [self.moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.centerY.mas_equalTo(self);
    }];
}

@end
