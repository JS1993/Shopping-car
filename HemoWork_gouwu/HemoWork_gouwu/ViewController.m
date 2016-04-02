//
//  ViewController.m
//  HemoWork_gouwu
//
//  Created by  江苏 on 16/3/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer* tapGR=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(move:)];
    [self.view addGestureRecognizer:tapGR];
}
-(void)move:(UITapGestureRecognizer*)gr{
    CGPoint point=[gr locationInView:self.view];
    if ((point.x>=self.imageView1.frame.origin.x&&point.x<=self.imageView1.frame.origin.x+self.imageView1.bounds.size.width)&&(point.y>=self.imageView1.frame.origin.y&&point.y<=self.imageView1.frame.origin.y+self.imageView1.bounds.size.height))
    {
    CGPoint point1=self.imageView1.center;
    self.imageView1.center=point1;
    self.imageView1.alpha=1;
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.imageView1.center=self.imageView2.center;
        self.imageView1.layer.transform=CATransform3DRotate(self.imageView1.layer.transform,M_PI, 0, 0, 1);
     } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.imageView1.alpha=0;
        } completion:^(BOOL finished) {
            self.imageView1.center=point1;
            self.imageView1.alpha=1;
            self.imageView1.layer.transform=CATransform3DRotate(self.imageView1.layer.transform,M_PI, 0, 0, 1);
        }];
     }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
