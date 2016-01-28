//
//  Demo6Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/28.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo6Controller.h"
#import "Masonry.h"
@implementation Demo6Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI
{
    UIView *lastView = self.view;
    for (int i = 0; i < 10; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        [self.view addSubview:view];
        view.layer.borderColor = [UIColor brownColor].CGColor;
        view.layer.borderWidth = 2.f;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(10, 5, 15, 20));
        }];
        lastView = view;
    }
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
