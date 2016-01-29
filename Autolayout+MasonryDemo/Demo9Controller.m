//
//  Demo9Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/29.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo9Controller.h"
#import "Masonry.h"

static NSString *ID = @"cell";
static CGFloat height = 230;
@interface Demo9Controller ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) MASConstraint *constraint;
@end

@implementation Demo9Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configUI];
    self.navigationController.hidesBarsOnTap = YES;
}

- (void)configUI
{
    //tableview
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    //tableview背后添加一个image
    UIImageView *image = [[UIImageView alloc] init];
    image.backgroundColor = [UIColor greenColor];
    image.image = [UIImage imageNamed:@"14b9c8d9c2511608f92a09cdb77802ed.jpg"];
    image.contentMode = UIViewContentModeScaleAspectFill;
    [self.view insertSubview:image belowSubview:self.tableView];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        self.constraint = make.height.mas_equalTo(height);
    }];
    
    //空白的header
    UIView *fakeTableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), height)];
    fakeTableHeader.backgroundColor = [UIColor clearColor];
    fakeTableHeader.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _tableView.tableHeaderView = fakeTableHeader;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0) {
        _constraint.equalTo(@(height - scrollView.contentOffset.y));
    } else {
        _constraint.equalTo(@(height));
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"cell-%ld",indexPath.row];
    return cell;
}
@end
