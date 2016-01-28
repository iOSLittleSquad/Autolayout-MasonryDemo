//
//  Demo5Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/28.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo5Controller.h"
#import "Masonry.h"
@interface Demo5Controller()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@end

typedef NS_ENUM(NSInteger, StepperType){
    StepperTypeLeftLabel = 100,
    StepperTypeRightLabel = 200
};
@implementation Demo5Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI
{
    //UIStepper
    UIStepper *leftStep = [[UIStepper alloc] init];
    [self.view addSubview:leftStep];
    leftStep.tag = StepperTypeLeftLabel;
    [leftStep addTarget:self action:@selector(lableChange:) forControlEvents:UIControlEventValueChanged];
    [leftStep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 0, 0));
    }];
    
    UIStepper *rightStep = [[UIStepper alloc] init];
    [self.view addSubview:rightStep];
    rightStep.tag = StepperTypeRightLabel;
    [rightStep addTarget:self action:@selector(lableChange:) forControlEvents:UIControlEventValueChanged];
    [rightStep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.view).insets(UIEdgeInsetsMake(50, 0, 0, 50));
    }];
    
    //lebels's supview
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        make.top.equalTo(self.view).offset(250);
        make.height.mas_equalTo(30);
    }];
    
    //labels
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.backgroundColor = [UIColor redColor];
    leftLabel.textColor = [UIColor whiteColor];
    self.leftLabel = leftLabel;
    [contentView addSubview:leftLabel];
    leftLabel.text = @"我在左边我牛逼";
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(contentView).insets(UIEdgeInsetsMake(2, 2, 0, 0));
    }];
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.backgroundColor = [UIColor blueColor];
    rightLabel.textColor = [UIColor whiteColor];
    self.rightLabel = rightLabel;
    [contentView addSubview:rightLabel];
    rightLabel.text = @"我在右边Orz";
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftLabel.mas_right).offset(2);
        make.top.equalTo(leftLabel);
        make.right.lessThanOrEqualTo(contentView.mas_right).offset(-2);
    }];
    
}

- (void)lableChange:(UIStepper *)stepper
{
    switch (stepper.tag) {
        case StepperTypeLeftLabel:
        {
            self.leftLabel.text = [self addLabelWithoriginalText:@"我在左边我牛逼" Value:stepper.value];
            break;
        }
        case StepperTypeRightLabel:{
            self.rightLabel.text = [self addLabelWithoriginalText:@"我在右边Orz" Value:stepper.value];
            break;
        }
        default:
            break;
    }
}

- (NSString *)addLabelWithoriginalText:(NSString *)originalText Value:(double)value
{
    NSMutableString *str = [NSMutableString stringWithString:originalText];
    
    for (int i = 0; i < value; i++) {
        [str appendFormat:@"哈哈哈"];
    }
    return str;
}

@end
