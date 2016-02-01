//
//  Demo10Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/2/1.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo10Controller.h"
#import "Masonry.h"
@interface Demo10Controller ()

@property (nonatomic, strong) MASConstraint *constraint;
@end

@implementation Demo10Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *containerView = [[UIView alloc] init];
    containerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:containerView];
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        self.constraint = make.size.mas_equalTo(CGSizeMake(300, 150));
        make.center.equalTo(self.view);
    }];
    
    UIView *redView = [[UIView alloc] init];
    [containerView addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(containerView);
        make.size.equalTo(containerView).multipliedBy(0.5);
    }];
    
    
    UISlider *slider = [[UISlider alloc] init];
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

}

- (void)move:(UISlider *)slider
{
    
    float progress = (slider.maximumValue - slider.value) / slider.maximumValue;
    self.constraint.mas_equalTo(CGSizeMake(300 * progress, 150 * progress));
}

@end
