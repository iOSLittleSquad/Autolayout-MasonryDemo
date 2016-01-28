//
//  Demo4Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/28.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo4Controller.h"
#import "Masonry.h"
@implementation Demo4Controller


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI
{
    //UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(50, 20, 50, 20));
    }];
    
    //contentView中间层,子控件全加在contentView上,scrollView根据content内部布局反算出contentSize
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor purpleColor];
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
    }];
    
    CGSize size = CGSizeMake(200, 200);
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [contentView addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.left.top.equalTo(contentView);
    }];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [contentView addSubview:blueView];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.top.right.equalTo(contentView);
        make.left.equalTo(redView.mas_right).offset(50);
    }];
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [contentView addSubview:yellowView];
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.left.bottom.equalTo(contentView);
        make.top.equalTo(redView.mas_bottom).offset(150);
    }];
    
    UIView *orangeView = [[UIView alloc] init];
    orangeView.backgroundColor = [UIColor orangeColor];
    [contentView addSubview:orangeView];
    [orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(contentView);
        make.size.mas_equalTo(size);
        make.top.equalTo(blueView.mas_bottom).offset(150);
        make.left.equalTo(yellowView.mas_right).offset(50);
    }];
}
@end
