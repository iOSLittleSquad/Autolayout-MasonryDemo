//
//  Demo7Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/28.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo7Controller.h"
#import "Masonry.h"

@interface Demo7Controller()
@property (nonatomic, strong) NSArray *views;
@property (nonatomic, assign) float offset;
@end
@implementation Demo7Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"move" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(move) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).insets(UIEdgeInsetsMake(20, 20, 0, 0));
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    self.offset = 0;
    
    CGSize size = CGSizeMake(50, 50);
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.centerY.equalTo(self.view);
        make.leading.equalTo(self.view).offset(20);
    }];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.centerY.equalTo(self.view);
        make.centerX.equalTo(self.view);
    }];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
        make.centerY.equalTo(self.view);
        make.trailing.equalTo(self.view).offset(-20);
    }];
    
    self.views = @[redView,blueView,greenView];
}

- (void)move
{
    self.offset += 40;
    [self.views mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view).offset(self.offset);
    }];
    
    [UIView animateWithDuration:1.f animations:^{
        [self.view layoutIfNeeded];
    }];
}
@end
