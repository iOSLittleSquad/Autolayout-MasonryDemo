//
//  ViewController.m
//  Autolayout+MasonryDemo
//
//  Created by 黄少华 on 16/1/27.
//  Copyright © 2016年 黄少华. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSArray *examples;
@end
static NSString *ID = @"tableViewCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Autolayout + Masonry";
    
    self.tableView = [UITableView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 50;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.examples = @[@"横竖屏保持宽高比例",
                      @"修改约束完成动画",
                      @"不借助contentView的UIScrollView",
                      @"借助contentView的UIScrollView",
                      @"并排label设置优先级",
                      @"循环创建view的约束",
                      @"对NSArray<UIView*>添加约束",
                      @"不等高tableview",
                      @"下拉放大tableHeaderView"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.examples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"demo%ld",(long)indexPath.row + 1];
    cell.detailTextLabel.text = self.examples[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class cls = NSClassFromString([NSString stringWithFormat:@"Demo%@Controller", @(indexPath.row+1)] );
    if (cls) {
        UIViewController *vc = [cls new];
        vc.edgesForExtendedLayout = UIRectEdgeNone;
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
