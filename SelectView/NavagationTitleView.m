//
//  NavagationTitleView.m
//  SelectView
//
//  Created by 杭州移领 on 16/11/1.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "NavagationTitleView.h"
@interface NavagationTitleView()
@property (nonatomic , strong) UIButton *selectedButton;
@property (nonatomic , strong) PopMenuView *menuView;

@end
@implementation NavagationTitleView

- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI:titles];
    }
    return self;
}


- (void)setUI:(NSArray *)titles {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat margin = 10;
    CGFloat buttonW = (self.frame.size.width - (titles.count + 1) * margin)/titles.count;
    for (NSInteger i = 0; i< titles.count; i ++) {
        CGRect frame = CGRectMake(margin + (margin + buttonW) * i, 0, buttonW, self.frame.size.height);
        UIButton *button = [[UIButton alloc] initWithFrame:frame];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor grayColor];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickTitle:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            self.selectedButton = button;
        }
        [self addSubview:button];
        
    }
}

- (PopMenuView *)menuView {
    
    if (!_menuView) {
        _menuView  = [[PopMenuView alloc] initWithFrame:CGRectMake(10, 57, ([UIScreen mainScreen].bounds.size.width - 3 * 10) /2, 150)];
        _menuView.backgroundColor = [UIColor clearColor];
    }
    return _menuView;
    
}

- (void)clickTitle:(UIButton *)button {
    CGRect frame = self.menuView.frame;
    frame.origin.x = button.frame.origin.x;
    self.menuView.frame = frame;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:self.menuView];
 }

@end
