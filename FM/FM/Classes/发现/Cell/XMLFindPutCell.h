//
//  XMLFindPutCell.h
//  FM
//
//  Created by home on 2017/9/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMLContenShowView;

@interface XMLFindPutCell : UITableViewCell

@property (nonatomic, strong) XMLContenShowView *leftContenShowView;

@property (nonatomic, strong) XMLContenShowView *centerContenShowView;

@property (nonatomic, strong) XMLContenShowView *rightContentShowView;

@property (nonatomic, strong) UILabel *leftDetailLabel;

@property (nonatomic, strong) UILabel *centerDetailLabel;

@property (nonatomic, strong) UILabel *rightDetailLabel;



@end
