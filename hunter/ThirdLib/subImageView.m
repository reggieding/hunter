//
//  subImageView.m
//  hc96871
//
//  Created by zhdooo on 15/1/7.
//  Copyright (c) 2015年 HC. All rights reserved.
//

#import "subImageView.h"

@implementation subImageView

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.touchTimer = [touch timestamp];
}


//touchesEnded，touch事件完成，根据此时时间点获取到touch事件的总时间，
- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.touchTimer = [touch timestamp] - self.touchTimer;
    
    NSUInteger tapCount = [touch tapCount];
    CGPoint touchPoint = [touch locationInView:self];
    
    //判断单击事件，touch时间和touch的区域
    if (tapCount == 1 && self.touchTimer <= 3 && CGRectContainsPoint(self.frame, touchPoint))
    {
        //进行单击的跳转等事件
        NSLog(@"touch me!");
    }
}

@end
