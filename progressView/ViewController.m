//
//  ViewController.m
//  progressView
//
//  Created by qianfeng on 15-8-4.
//  Copyright (c) 2015年 LZ. All rights reserved.
//

#import "ViewController.h"
#import "progressview.h"
@interface ViewController ()
//slider 值改变时调用
- (IBAction)valueChange:(id)sender;
// 显示百分比
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建一个环形进度视图
    progressview * progress = [[progressview alloc]initWithFrame:CGRectMake(10, 40, 300, 300)];
    //设置tag值
    progress.tag = 1;
    [self.view addSubview:progress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//slide change value方法
- (IBAction)valueChange:(id)sender {
     progressview * progress = (progressview *)[self.view viewWithTag:1];
    progress.progress = ((UISlider *)sender).value;
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%",progress.progress*100];
    
}
@end
