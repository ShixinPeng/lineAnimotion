//
//  ViewController.m
//  lineAnimotion
//
//  Created by pengshixin on 16/6/23.
//  Copyright © 2016年 pengshixin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    
    
//    [UIView animateWithDuration:0.75 animations:^{
//        [self checkAnimation];
//        
//    } completion:^(BOOL finished) {
//        [self showLogView];
//    }];
    //添加呼吸灯
    [self startLight];
}
-(void)checkAnimation{
    
    CAShapeLayer *checkLayer = [CAShapeLayer layer];
    checkLayer.frame = CGRectMake(100, 100, 200, 200);
    //    UIBezierPath *path = [UIBezierPath bezierPath];
    //    CGRect rectInCircle = CGRectInset(self.view.bounds, self.view.bounds.size.width*(1-1/sqrt(2.0))/2, self.view.bounds.size.width*(1-1/sqrt(2.0))/2);
    //    [path moveToPoint:CGPointMake(rectInCircle.origin.x + rectInCircle.size.width/9, rectInCircle.origin.y + rectInCircle.size.height*2/3)];
    //    [path addLineToPoint:CGPointMake(rectInCircle.origin.x + rectInCircle.size.width/3,rectInCircle.origin.y + rectInCircle.size.height*9/10)];
    //    [path addLineToPoint:CGPointMake(rectInCircle.origin.x + rectInCircle.size.width*8/10, rectInCircle.origin.y + rectInCircle.size.height*2/10)];
    
    UIBezierPath *arc = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100.0f startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    checkLayer.path = arc.CGPath;
    checkLayer.fillColor = [UIColor clearColor].CGColor;
    checkLayer.strokeColor = [UIColor yellowColor].CGColor;
    
    checkLayer.lineWidth = 10.0;
    checkLayer.lineCap = kCALineCapRound;
    checkLayer.lineJoin = kCALineJoinRound;
    
    
    [self.view.layer addSublayer:checkLayer];
    
    
    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimation.duration = 1.0f;
    checkAnimation.fromValue = @(0.0f);
    checkAnimation.toValue = @(1.0f);
    checkAnimation.delegate = self;
    [checkAnimation setValue:@"checkAnimation" forKey:@"animationName"];
    [checkLayer addAnimation:checkAnimation forKey:nil];
    
}
-(void)showLogView{
    CALayer *iamgeLayer = [CALayer layer];
    UIImage *image = [UIImage imageNamed:@"1"];
    iamgeLayer.frame = CGRectMake(100, 100, 200, 200);
    
    iamgeLayer.contents = (__bridge id)image.CGImage;
    iamgeLayer.cornerRadius = iamgeLayer.bounds.size.width * 0.5;
    iamgeLayer.masksToBounds = YES;
    [self.view.layer addSublayer:iamgeLayer];
    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    checkAnimation.duration = 0.75f;
    checkAnimation.fromValue = @(0.0f);
    checkAnimation.toValue = @(1.0f);
    checkAnimation.delegate = self;
    [checkAnimation setValue:@"checkAnimation" forKey:@"animationName"];
    [iamgeLayer addAnimation:checkAnimation forKey:nil];
    
}
-(void)startLight{
    CALayer *iamgeLayer = [CALayer layer];
    UIImage *image = [UIImage imageNamed:@"1"];
    iamgeLayer.frame = CGRectMake(100, 100, 200, 200);
    
    iamgeLayer.contents = (__bridge id)image.CGImage;
    iamgeLayer.cornerRadius = iamgeLayer.bounds.size.width * 0.5;
    iamgeLayer.masksToBounds = YES;
    [self.view.layer addSublayer:iamgeLayer];
    
    //[iamgeLayer addAnimation:<#(nonnull CAAnimation *)#> forKey:<#(nullable NSString *)#>]
    [iamgeLayer addAnimation:[self AlphaLight:1.2f] forKey:@"aAlpha"];
}
-(CABasicAnimation *) AlphaLight:(float)time
{
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];//这是透明度。
    animation.autoreverses = YES;
    animation.duration = time;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    //[animation.timingFunction CAMediaTimingFunctionfunctionWithName:kCAMediaTimingFunctionEaseIn];
    
    return animation;
}
@end
