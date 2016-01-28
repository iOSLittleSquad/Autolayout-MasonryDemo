//
//  Demo3Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/28.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo3Controller.h"
#import "Masonry.h"
@implementation Demo3Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)configUI
{
    //UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor whiteColor];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(50, 20, 50, 20));
    }];
    
    //subviews
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:redView];
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview:yellowView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:greenView];
    
    //subview约束
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.width.equalTo(scrollView);
        make.height.equalTo(@250);
    }];
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.equalTo(scrollView);
        make.top.equalTo(redView.mas_bottom);
        make.height.equalTo(@250);
    }];

    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.width.equalTo(scrollView);
        make.top.equalTo(yellowView.mas_bottom);
        make.height.equalTo(@250);
    }];
}
@end
