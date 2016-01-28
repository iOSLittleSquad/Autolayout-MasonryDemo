//
//  Demo2Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/27.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo2Controller.h"
#import "Masonry.h"

@interface Demo2Controller()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UISlider *slider;
@end
@implementation Demo2Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISlider *slider = [[UISlider alloc] init];
    self.slider = slider;
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.tintColor = [UIColor redColor];
    [self.view addSubview:slider];
    [slider addTarget:self action:@selector(move:) forControlEvents:UIControlEventValueChanged];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading).offset(20.f);
        make.trailing.equalTo(self.view.mas_trailing).offset(-20.f);
        make.bottom.equalTo(self.view).offset(-20.f);
    }];
    
    UIView *redView = [[UIView alloc] init];
    self.redView = redView;
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.leading.equalTo(self.slider.mas_leading);
        make.centerY.equalTo(self.view);
    }];
}

- (void)move:(UISlider *)slider
{
    float progress = slider.value / 100;
    float width = self.slider.frame.size.width;

    [UIView animateWithDuration:1.0 animations:^{
        [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.slider.mas_leading).offset(width * progress);
        }];
        
        [self.redView layoutIfNeeded];
    }];
}
@end
