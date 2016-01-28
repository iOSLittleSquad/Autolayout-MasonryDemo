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
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor whiteColor];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(50, 20, 50, 20));
    }];
    
    
}
@end
