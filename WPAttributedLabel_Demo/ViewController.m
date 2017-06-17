//
//  ViewController.m
//  WPAttributedLabel_Demo
//
//  Created by 孙亚锋 on 2017/6/17.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "ViewController.h"
#import "NSString+WPAttributedMarkup.h"
#import "WPAttributedStyleAction.h"
#import "WPHotspotLabel.h"
#import <CoreText/CoreText.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet WPHotspotLabel *labelThree;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary* style1 = @{@"body":[UIFont fontWithName:@"HelveticaNeue" size:18.0],
                             @"bold":[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0],
                             @"red": [UIColor redColor],
                             @"blue":[UIColor blueColor]};
    
    NSDictionary* style2 = @{@"body":@[[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0],[UIColor darkGrayColor]],@"u": @[[UIColor blueColor],@{NSUnderlineStyleAttributeName : @(kCTUnderlineStyleSingle|kCTUnderlinePatternSolid)}],@"point":[UIImage imageNamed:@"redPoint"] };
    
    
    
    NSDictionary* style3 = @{@"body":[UIFont fontWithName:@"HelveticaNeue" size:16.0],
                             @"blue":[WPAttributedStyleAction styledActionWithAction:^{
                                 NSLog(@"点击了 bule色");
                                 self.view.backgroundColor = [UIColor blueColor];
                             }],
                             @"orange":[WPAttributedStyleAction styledActionWithAction:^{
                                 NSLog(@"点击了 orange色");
                                 self.view.backgroundColor = [UIColor orangeColor];
                             }],
                             @"u": @[[UIColor blueColor],
                                     @{NSUnderlineStyleAttributeName : @(kCTUnderlineStyleSingle|kCTUnderlinePatternSolid)}
                                     ],
                             @"white":[WPAttributedStyleAction styledActionWithAction:^{
                                 NSLog(@"点击了 bai 色");
                                 self.view.backgroundColor = [UIColor whiteColor];
                             }],
                             @"lig":[WPAttributedStyleAction styledActionWithAction:^{
                                 NSLog(@"点击了 灰色");
                                 self.view.backgroundColor = [UIColor lightGrayColor];
                             }],
                             @"cyan":[WPAttributedStyleAction styledActionWithAction:^{
                                 NSLog(@"点击了 青色");
                                 self.view.backgroundColor = [UIColor cyanColor];
                             }],
                             
                             @"link": [UIColor greenColor]};
    
    self.labelOne.attributedText = [@"我被设置成 <bold>粗体</bold> 我可以是<red>红色的</red> 也可以是<blue>绿色的</red>的文字" attributedStringWithStyleBook:style1];
    self.labelTwo.attributedText = [@"<point> </point> 字体 <u>样式</u> +图片 <point> </point>" attributedStringWithStyleBook:style2];
    
    
    self.labelThree.attributedText = [@"可以点击背景变色<blue><u>蓝色</u></blue>也可以点击变成<orange>橙色</orange>试一试,试玩了再点击<white>白色</white>试一试,是不是都可以呢<lig><u>灰色</u></lig>,多个对应就好<cyan>青色</cyan>" attributedStringWithStyleBook:style3];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
