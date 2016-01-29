//
//  Demo8Controller.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/29.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "Demo8Controller.h"
#import "Demo8Cell.h"
#import "Demo8Model.h"
#import "Masonry.h"
#define IOS_8_NEW_FEATURE_SELF_SIZING

@interface Demo8Controller ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *datas;
@end

@implementation Demo8Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
#ifdef IOS_8_NEW_FEATURE_SELF_SIZING
    if ([UIDevice currentDevice].systemVersion.integerValue > 7) {
        self.tableView.rowHeight = UITableViewAutomaticDimension;
    }
#endif
    [self.tableView registerClass:[Demo8Cell class] forCellReuseIdentifier:NSStringFromClass([Demo8Cell class])];
    
    [self initDatas];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
#ifdef IOS_8_NEW_FEATURE_SELF_SIZING
    return UITableViewAutomaticDimension;
#else
    static Demo8Cell *cell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Demo8Cell class])];
    });
    
    Demo8Model *model = self.datas[indexPath.row];
    if (model.rowHeight <= 0) {
        cell.model = model;
        model.rowHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 0.5;
        
    }else{
        
    }
    
    NSLog(@"height == %f",model.rowHeight);

    return model.rowHeight;
#endif
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Demo8Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Demo8Cell class]) forIndexPath:indexPath];
    cell.model = self.datas[indexPath.row];
    return cell;
}

- (void)initDatas
{
    NSMutableArray *tmpData = [NSMutableArray new];
    
    for (int i = 0; i < 20; i++) {
        Demo8Model *model = [Demo8Model new];
        model.title = [NSString stringWithFormat:@"Title: %d", i];
        model.content = [self getText:@"content-" withRepeat:i * 2 + 1];
        [tmpData addObject:model];
    }
    
    _datas = tmpData;
}

- (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 80;
        _tableView.tableFooterView = UIView.new;
    }
    return _tableView;
}
@end
