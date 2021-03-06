//
//  UIView+ATFrameWrapper.h
//  SmartLamp
//
//  Created by Aesir Titan on 2016-08-09.
//  Copyright © 2016 Titan Studio. All rights reserved.
//


#import <UIKit/UIKit.h>


#pragma mark - inline function

#pragma mark UIView



@interface UIView (ATFrameWrapper)

#pragma mark - property

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;


#pragma mark - chain


// width
- (UIView *(^)(CGFloat))widthEqual;
// height
- (UIView *(^)(CGFloat))heightEqual;
// width and height
- (UIView *(^)(CGFloat))widthAndHeightEqual;
// center
- (UIView *(^)(UIView *))centerEqual;

// left and right
- (UIView *(^)(CGFloat))leftAndRightMargin;
// top and bottom
- (UIView *(^)(CGFloat))topAndBottomMargin;


@end
