//
//  XMLHomePageViewController.m
//  FM
//
//  Created by home on 2017/9/19.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "XMLHomePageViewController.h"
#import <SDCycleScrollView.h> //轮播图
#import "XMLHeadTitleView.h" //组头视图
#import "XMLFootView.h"//组尾视图

#import "XMLContenShowView.h"
#import "XMLFindPutCell.h"

static NSString *homeFindPutCellID = @"homeFindPutCellID";

@interface XMLHomePageViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,ContenShowViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *oneDataArray;

@property (nonatomic, strong) NSArray *twoDataArray;

@end

@implementation XMLHomePageViewController


#pragma mark - View life circle ViewController生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

#pragma mark - Custom Methods 自定义方法
- (void)setupUI {
    
    self.tableView.hidden = NO;
    NSArray * a =@[@"代码告诉我，你只是个测试版",@"嗯我知道",@"他说他知道"];
    [self.oneDataArray addObjectsFromArray:a];
    [self.tableView reloadData];
}

#pragma mark - DataSource & Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        
        XMLFindPutCell * cell = [tableView dequeueReusableCellWithIdentifier:homeFindPutCellID];
        
        cell.leftContenShowView.contentLabel.text =self.oneDataArray[indexPath.row];
        [cell.leftContenShowView.contentImageView setImage:[UIImage imageNamed:@"coolStart_worker_s"]];
        cell.leftContenShowView.delegate = self;
        cell.leftContenShowView.tag = indexPath.section * 10 + 0;
        cell.leftDetailLabel.text = self.oneDataArray[indexPath.row];
        
        cell.centerContenShowView.contentLabel.text =self.oneDataArray[indexPath.row];
        [cell.centerContenShowView.contentImageView setImage:[UIImage imageNamed:@"coolStart_worker_s"]];
        cell.centerContenShowView.delegate = self;
        cell.centerContenShowView.tag = indexPath.section * 10 + 1;
        cell.centerDetailLabel.text = self.oneDataArray[indexPath.row];

        
        cell.rightContentShowView.contentLabel.text =self.oneDataArray[indexPath.row];
        [cell.rightContentShowView.contentImageView setImage:[UIImage imageNamed:@"coolStart_worker_s"]];
        cell.rightContentShowView.delegate = self;
        cell.rightContentShowView.tag = indexPath.section * 10 + 2;
        cell.rightDetailLabel.text = self.oneDataArray[indexPath.row];

        return cell;
    }
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell.textLabel.text = self.oneDataArray[indexPath.row];
        
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第%zd组，第%zd行",indexPath.section,indexPath.row);
}
//Section头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    XMLHeadTitleView *view = [[XMLHeadTitleView alloc] initWithTitle:@"小编推荐" hasMore:1];
    
    if (section >= 1) {
        view.titleLabel.text = @"热门推荐";
    }
    
    return view;
}
//Section尾
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    XMLFootView *view = [[XMLFootView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 50/KScreenW*KScreenW)];
//    view.backgroundColor = [UIColor whiteColor];
//    __weak typeof(self)weadSelf = self;
//    [view.moreButton addActionHandle:^(UIButton *button) {
//        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:section];
//        [weadSelf.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
//    }];
//    return view;
//
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        return 160;
    }
    else if (indexPath.section == 1) {
        return 250;
    }
    else return 100;
}
//section头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 35;
}
//section尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50;
}

//是否允许点击高亮
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {

    return NO;
}
- (void)contenShowViewClickatIndex:(NSInteger)tag {
    NSLog(@"%zd",tag);
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    NSLog(@"点击了第%zd张轮播图",index);
}

#pragma mark - getter & setter
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [UITableView initWithFrame:CGRectZero style:UITableViewStyleGrouped cellSeparatorStyle:UITableViewCellSeparatorStyleNone separatorInset:UIEdgeInsetsMake(0, 0, 0, 0) dataSource:self delegate:self];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenW, KScreenW/660*310) delegate:self placeholderImage:[UIImage imageNamed:@"coolStart_worker_s"]];
        
        _tableView.tableHeaderView = _cycleScrollView;
        
        //三个按钮视图
        [_tableView registerClass:[XMLFindPutCell class] forCellReuseIdentifier:homeFindPutCellID];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
- (NSMutableArray *)oneDataArray {
    
    if (!_oneDataArray) {
        _oneDataArray = @[].mutableCopy;
    }
    return _oneDataArray;
}

//- (void)viewSafeAreaInsetsDidChange
//{
//    [super viewSafeAreaInsetsDidChange];
//
//    safeInsets = self.view.safeAreaInsets;
//
//    if (!isSafeInsetsAdjusted) {
//        isSafeInsetsAdjusted = YES;
//
//        CGRect frame = rootView.frame;
//        frame.size.height -= safeInsets.bottom;
//        rootView.frame = frame;
//    }
//}

@end
