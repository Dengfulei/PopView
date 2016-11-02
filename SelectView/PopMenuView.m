//
//  PopMenuView.m
//  SelectView
//
//  Created by 杭州移领 on 16/11/1.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "PopMenuView.h"
@interface PopMenuView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;
@end
@implementation PopMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
    }
    return self;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _tableView.layer.cornerRadius = 6;
        _tableView.layer.masksToBounds = YES;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"我是测试数据%ld",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath");
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    // 填充颜色
    CGContextSetFillColorWithColor(contextRef, [UIColor whiteColor].CGColor);
//    CGContextSetRGBFillColor(contextRef, 255.0/255.0, 255.0/255.0, 255.0/255.0, 1);
    CGContextSetLineWidth(contextRef, 1);
    //     圆角半径
    CGFloat radius = 6.0f;
    //    突出部分高度
    CGFloat specialLocationHeight = 10;
    //    绘制后最小
    CGFloat minX = CGRectGetMinX(self.bounds);
    //    绘制后Y
    CGFloat minY = CGRectGetMinY(self.bounds) + specialLocationHeight;
    //    最大
    CGFloat maxX = CGRectGetMaxX(self.bounds);
    CGFloat maxY = CGRectGetMaxY(self.bounds) ;
    //    中间
    CGFloat midX = CGRectGetMidX(self.bounds);
    //绘制突出部分
    CGContextMoveToPoint(contextRef, midX - specialLocationHeight, minY);
    CGContextAddLineToPoint(contextRef, midX , minY - specialLocationHeight);
    CGContextAddLineToPoint(contextRef, midX + specialLocationHeight, minY);
    //绘制边界及圆角
    CGContextAddArcToPoint(contextRef, maxX, minY, maxX, maxY, radius);
    CGContextAddArcToPoint(contextRef,  maxX, maxY, minX, maxY, radius);
    CGContextAddArcToPoint(contextRef,  minX, maxY, minX, minY, radius);
    CGContextAddArcToPoint(contextRef,  minX, minY , midX - specialLocationHeight, minY, radius);
    CGContextClosePath(contextRef);
    
    
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    
    self.layer.shadowOpacity = 1;
    
    self.layer.shadowOffset = CGSizeMake(0, 0);
    CGContextFillPath(contextRef);
    
}

@end
