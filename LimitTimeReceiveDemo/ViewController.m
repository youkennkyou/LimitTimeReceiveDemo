//
//  ViewController.m
//  LimitTimeReceiveDemo
//
//  Created by 姚建强 on 16/1/9.
//  Copyright © 2016年 com.yjq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,weak) NSTimer *timer;
@property(nonatomic,assign) NSInteger num;
@property(nonatomic,weak)   LimitTimeReceiveCell *weakCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _num=0;
    _tableView=[[UITableView alloc] init];
    _tableView.frame=self.view.frame;
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        LimitTimeReceiveCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[LimitTimeReceiveCell alloc] init];
    }
    _weakCell=cell;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
   
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        _timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
        NSLog(@"begin");
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];

    
    });
//    _sthread=[[TimerThread alloc] init];
//    [_sthread start];
    cell.delegate=self;
    return cell;



}

-(void) timerRun{
    [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:YES];
    _num++;

}
-(void) updateUI{
    
    _weakCell.textLabel.text=[NSString stringWithFormat:@"%zi",_num];

}

-(void)limitTimeReceiveCellDealloc{

    [_timer invalidate];
    _timer=nil;


}


@end
