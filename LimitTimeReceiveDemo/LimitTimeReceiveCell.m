//
//  LimitTimeReceiveCell.m
//  LimitTimeReceiveDemo
//
//  Created by 姚建强 on 16/1/9.
//  Copyright © 2016年 com.yjq. All rights reserved.
//

#import "LimitTimeReceiveCell.h"

@implementation LimitTimeReceiveCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)dealloc{
    if (_delegate&&[_delegate respondsToSelector:@selector(limitTimeReceiveCellDealloc)]) {
        [_delegate limitTimeReceiveCellDealloc];
    }


}
@end
