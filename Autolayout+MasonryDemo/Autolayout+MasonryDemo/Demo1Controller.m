//
//  Demo1Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/27.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo1Controller.h"
#import "Masonry.h"
@implementation Demo1Controller


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor blackColor];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self.view);
        make.height.equalTo(view.mas_width).multipliedBy(9.f / 16.f);
    }];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


@end
