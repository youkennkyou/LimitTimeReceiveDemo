//
//  ViewController.h
//  LimitTimeReceiveDemo
//
//  Created by 姚建强 on 16/1/9.
//  Copyright © 2016年 com.yjq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LimitTimeReceiveCell.h"
@interface ViewController : UIViewController<LimitTimeReceiveCellDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;



@end

