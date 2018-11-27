//
//  YYMainViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/10/19.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYMainViewController.h"
#import "YYMainTableViewCell.h"

@interface YYMainViewController ()<UITableViewDelegate,UITableViewDataSource>
//列表
@property (nonatomic,strong) UITableView *tableView;
//展示数据源
@property (nonatomic,strong) NSMutableArray *dataSoure;
//控制器数据源
@property (nonatomic,strong) NSMutableArray *controllerSoure;
@end

@implementation YYMainViewController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ctrlString = self.controllerSoure[indexPath.row];
    Class viewControl = NSClassFromString(ctrlString);
    UIViewController *viewcontroller = [[viewControl alloc]init];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return self.dataSoure.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleLabel.text = self.dataSoure[indexPath.row];
    return cell;
}

#pragma mark - Getters And Setters
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"YYMainTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (NSMutableArray *)dataSoure
{
    if (!_dataSoure)
    {

        _dataSoure = [[NSMutableArray alloc]initWithObjects:
                      @"Block基础知识",
                      @"链式编程思想",
                      @"RACSignal用法",
                      @"RACObserve用法",
                      @"RACSignal用法",
                      @"UIButton",nil];
    }
    return _dataSoure;
}

- (NSMutableArray *)controllerSoure
{
    if (!_controllerSoure)
    {
        _controllerSoure = [[NSMutableArray alloc] initWithObjects:
                            @"YYBlockBasicController",
                            @"YYChainViewController",
                            @"YYRACSignalController",
                            @"RACBasicViewController",
                            @"RACSignalViewController",
                            @"RACButtonViewController",nil];
    }
    return _controllerSoure;
}

@end
