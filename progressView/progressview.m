//
//  UIView.m
//  progressView
//
//  Created by shenZhenNewWorld on 15-8-4.
//  Copyright (c) 2015年 LZ. All rights reserved.
//

#import "progressview.h"
//定义线宽
#define KCircleProgressViewLineWidth 20

@interface progressview ()
{
    //轨迹图层
    CAShapeLayer * _circleLayer;
    //轨迹路径
    UIBezierPath * _circlePath;
    //进度图层
    CAShapeLayer * _progressLayer;
    //轨迹图层
    UIBezierPath * _progresspath;

}


@end

@implementation progressview

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        //设置 轨迹图层
        [self circleLayer];
        //设置 进度图层
        [self progressLayer];
        
    }
    
    return self;
}

- (void)circleLayer
{
    //使用懒加载
    if (!_circleLayer) {
        
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.frame = self.bounds;
        //把 circleLayer 的填充颜色设置成透明
        _circleLayer.fillColor = [UIColor clearColor].CGColor;
        //设置线宽
        _circleLayer.lineWidth = KCircleProgressViewLineWidth;
        //设置线的颜色
        _circleLayer.strokeColor = [UIColor blackColor].CGColor;
        [self.layer addSublayer:_circleLayer];
        //设置路径
        _circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2) radius:self.bounds.size.width/2-KCircleProgressViewLineWidth/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
        //添加路径
        _circleLayer.path = _circlePath.CGPath;
        [self.layer addSublayer:_circleLayer];

    }
    
}

- (void)progressLayer
{
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.frame = self.bounds;
        _progressLayer.fillColor = [UIColor clearColor].CGColor;
        _progressLayer.lineWidth = KCircleProgressViewLineWidth;
        
        _progressLayer.strokeColor = [UIColor yellowColor].CGColor;
        [self.layer addSublayer:_progressLayer];
        //设置进度 最初为0；
        self.progress = 0;
        [self.layer addSublayer:_progressLayer];
        
    }


}

- (void)setProgress:(CGFloat)progress
{

    _progress = progress;
    _progresspath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2) radius:self.bounds.size.width/2-KCircleProgressViewLineWidth/2 startAngle:0 endAngle:M_PI*2*progress clockwise:YES];
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.path = _progresspath.CGPath;
}

@end
