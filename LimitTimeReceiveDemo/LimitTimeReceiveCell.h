//
//  LimitTimeReceiveCell.h
//  LimitTimeReceiveDemo
//
//  Created by 姚建强 on 16/1/9.
//  Copyright © 2016年 com.yjq. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LimitTimeReceiveCellDelegate <NSObject>

-(void) limitTimeReceiveCellDealloc;

@end


@interface LimitTimeReceiveCell : UITableViewCell
@property (nonatomic,weak) id<LimitTimeReceiveCellDelegate> delegate;
@end
