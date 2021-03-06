//
//  TestViewController.m
//  iOSBase
//
//  Created by wb on 2018/5/23.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TestViewController.h"
#import "TestModel.h"
#import "TestCell.h"
@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataAry;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"测试";
	
	[self.tableView reloadData];
	
	if (self.dataAry.count == 0) {
		self.tableView.backgroundColor = KClearColor;
		if (!self.placeholderView) {
			[self addPlaceholeerViewFrame:CGRectMake(0, 0, KScreenWidth, 320) withType:CQPlaceholderViewTypeNoData desText:@"暂时没有数据"];
		}
	}else {
		self.tableView.backgroundColor = KWhiteColor;
	}	
}

- (NSMutableArray *)dataAry{
	if (!_dataAry) {
		_dataAry = [NSMutableArray array];
	}
	return _dataAry;
}

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
		_tableView.delegate = self;
		_tableView.dataSource = self;
		[self.view addSubview:_tableView];
	}
	return _tableView;
}

#pragma mark- 父类方法
- (void)reloadViewData {
	// 设置数据
	[self.dataAry removeAllObjects];
	
	for (int i = 0; i<10; i++) {
		TestModel *test = [[TestModel alloc] init];
		[test setTitle:@"我是一条cell"];
		[self.dataAry addObject:test];
	}
	[self.tableView reloadData];
}

#pragma mark- 代理方法
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if (!cell) {
		cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
	}
	
	cell.model = self.dataAry[indexPath.row];
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return self.dataAry.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
	return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
	return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 0.001f;
}



@end
