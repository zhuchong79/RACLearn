//
//  MainViewController.h
//  TableViewTest
//
//  Created by hxl on 16/4/18.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController :  UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) NSArray *dataList;
@property (nonatomic, retain) UITableView *myTableView;

@end
