//
//  BaseViewController.m
//  Keepcaring
//
//  Created by mac on 2017/12/12.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<CQPlaceholderViewDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
    /**<设置导航栏背景颜色*/
	self.navigationController.navigationBar.barTintColor = CNavBgColor;
	
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
	//设置导航栏 字体大小 颜色等
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:18]}];
	
	//去掉透明后导航栏下边的黑边
	[self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
	
}

- (void)reloadViewData{
	[self.placeholderView removeFromSuperview];
	
	
}

- (void)addPlaceholeerViewFrame:(CGRect)frame withType:(CQPlaceholderViewType)type desText:(NSString *)text{
	_placeholderView = nil;
	
	_placeholderView = [[CQPlaceholderView alloc] initWithFrame:frame type:type delegate:self];
	[_placeholderView setDesText:text];
	
	[self.view addSubview:_placeholderView];
	// 如果需要用 其他方式刷新页面， 就可以将试图添加在最底部，
	//[self.view insertSubview:_placeholderView atIndex:0];
	//如果由自身的控件刷新页面，就将视图添加在最上层
	[self.view bringSubviewToFront:_placeholderView];
}

#pragma mark - Delegate - 占位图
/** 占位图的重新加载按钮点击时回调 */
- (void)placeholderView:(CQPlaceholderView *)placeholderView reloadButtonDidClick:(UIButton *)sender{
	switch (placeholderView.type) {
		case CQPlaceholderViewTypeNoGoods:       // 没商品
		{
			//[self.view makeToast:@"买个球啊"];
		}
			break;
			
		case CQPlaceholderViewTypeNoData:       // 没有订单
		{
			//[self.view makeToast:@"拉到就拉到"];
		}
			break;
			
		case CQPlaceholderViewTypeNoNetwork:     // 没网
		{
			//[self.view makeToast:@"没网适合打排位"];
		}
			break;
			
		default:
			break;
	}
	// 重新加载页面
	[self reloadViewData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
