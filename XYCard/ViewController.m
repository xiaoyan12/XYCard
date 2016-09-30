//
//  ViewController.m
//  XYCard
//
//  Created by 闫世超 on 16/9/29.
//  Copyright © 2016年 闫世超. All rights reserved.
//

#import "ViewController.h"
#import <UIButton+WebCache.h>

#define XYScreenW [UIScreen mainScreen].bounds.size.width
#define btnW 90
#define btnH 120
@interface ViewController ()
@property (nonatomic ) CGFloat images;

@property (nonatomic ,strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTheImageView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setUpTheImageView{
    for (int i = 0; i < 16; i++) {
        UIButton *imgBtn = [[UIButton alloc]init];
        imgBtn.layer.cornerRadius = 15;
        imgBtn.layer.borderWidth = 2;
        imgBtn.layer.borderColor = i % 2 ? [UIColor yellowColor].CGColor : [UIColor redColor].CGColor;
        imgBtn.layer.masksToBounds = YES;
        imgBtn.tag = 100 + i;
        NSString *path = [NSString stringWithFormat:@"%zd.jpg",i];
        NSURL *url = [[NSBundle mainBundle] URLForResource:path withExtension:nil];
        [imgBtn sd_setBackgroundImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"placehold.jpg"]];
        
        CGFloat btnY = (XYScreenW + btnW) * 0.3;
        CGFloat btnX = 10 + btnH * 0.3 * i;
        imgBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        _button = imgBtn;
        [imgBtn addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:imgBtn];
    }
}

-(void)imageBtnClick:(UIButton *)sender{
    if (sender.frame.origin.y != self.images) {
        CGFloat btnY = (XYScreenW + btnW) *0.25;
        self.images = btnY;
        [UIView animateWithDuration:0.5 animations:^{
            sender.frame = CGRectMake(sender.frame.origin.x, btnY, btnW, btnH);
        }];
    }else{
        CGFloat btnY = (XYScreenW + btnW) *0.3;
       
        [UIView animateWithDuration:0.5 animations:^{
            sender.frame = CGRectMake(sender.frame.origin.x, btnY, btnW, btnH);
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
