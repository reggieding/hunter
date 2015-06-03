//
//  subImageView.h
//  hc96871
//
//  Created by zhdooo on 15/1/7.
//  Copyright (c) 2015年 HC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface subImageView : UIImageView
{
//    UIImageView *imageView;
//    NSTimeInterval touchTimer; //记录touch时间,来控制点击和滑动判断
}

//@property(nonatomic, retain) UIImageView *imageView;
@property(nonatomic, assign) NSTimeInterval touchTimer;

@end
