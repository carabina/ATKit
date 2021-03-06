//
//  UIViewController+DrawerGesture.m
//  DearyPet
//
//  Created by Aesir Titan on 2016-08-20.
//  Copyright © 2016 Titan Studio. All rights reserved.
//

#import "UIViewController+DrawerGesture.h"

// ==================== [ parameters ] ==================== //

static CGFloat sScale = 1.0f;
static CGFloat sRightLimit = 60.0f;
static CGFloat sLeftLimit = 80.0f;
static CGFloat sLeftRatio = 0.3f;

// ==================== [ marco ] ==================== //
// screen
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenCenterX (0.5 * kScreenW)
#define kScreenCenterY (0.5 * kScreenH)
#define kScreenCenterX_Opened (kScreenCenterX + kScreenW - sRightLimit)

// ==================== [ variable ] ==================== //
static UIViewController *sMainVC = nil;
static UIViewController *sDrawerVC = nil;
static UIPanGestureRecognizer *sPan = nil;
static BOOL sLeftViewOpen = NO;
static BOOL sEnable = YES;

@implementation UIViewController (DrawerGesture)

- (void)at_setupMainVC:(nonnull UIViewController *)mainVC drawerVC:(nonnull UIViewController *)drawerVC enable:(BOOL)enable{
    
    if (mainVC&&drawerVC){
        
        // ==================== [ setup controllers ] ==================== //
        sDrawerVC = drawerVC;
        // add child view controller
        [self addChildViewController:drawerVC];
        // add subview
        [self.view addSubview:drawerVC.view];
        
        sMainVC = mainVC;
        // add child view controller
        [self addChildViewController:mainVC];
        // add subview
        [self.view addSubview:mainVC.view];
        mainVC.view.layer.shadowRadius = 2.0f;
        mainVC.view.layer.shadowOffset = CGSizeMake(0, 0);
        mainVC.view.layer.shadowOpacity = 0.7f;
        
        // ==================== [ setup controllers ] ==================== //
        if (enable) {
            [self setupPanGesture];
        }
        
    }
    else{
        // show alert
        [self performSelector:@selector(showAlert) withObject:nil afterDelay:0.3];
    }
}


- (void)at_disableGeatureInChlidController{
    if (self.navigationController.viewControllers.count == 1) {
        // root view controller
        self.enableGesture = YES;
    } else{
        // not root view controller
        self.enableGesture = NO;
    }
}



#pragma mark - setting methods

- (UIViewController * _Nonnull (^)(CGFloat))scale{
    return ^(CGFloat scale){
        sScale = scale;
        return self;
    };
}

- (UIViewController * _Nonnull (^)(CGFloat))rightLimit{
    return ^(CGFloat limit){
        sRightLimit = limit;
        return self;
    };
}

- (UIViewController * _Nonnull (^)(CGFloat))leftLimit{
    return ^(CGFloat limit){
        sLeftLimit = limit;
        return self;
    };
}

- (UIViewController * _Nonnull (^)(CGFloat))leftRatio{
    return ^(CGFloat ratio){
        sLeftRatio = ratio;
        return self;
    };
}



#pragma mark - private methods


// add pan gesture
- (void)setupPanGesture {
    
    sPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:sPan];
    
}


- (void)handlePanGesture:(UIPanGestureRecognizer *)sender{
    
    // ==================== [ filter ] ==================== //
    if (!sEnable) {
        return;
    }
    const CGFloat translationX = [sender translationInView:self.view].x;
    const CGFloat velocityX = [sender velocityInView:self.view].x;
    // ==================== [ sliding... ] ==================== //
    // touch point moved
    if (sender && sender.state == UIGestureRecognizerStateChanged) {
        
        if (sMainVC.view.center.x < kScreenCenterX) {
            // move left
            [self moveLeftWithTranslationX:translationX];
        } else {
            // move right
            [self moveRightWithTranslationX:translationX];
        }
        
    }
    // touch up
    if (sender && sender.state == UIGestureRecognizerStateRecognized) {
        
        // open or close drawer vc depend on velocityX
        if (fabs(velocityX)>500) {
            [self openDrawerViewIf:velocityX > 500];
        } else {
            // open or close drawer vc depend on location
            const CGFloat leftDistance  = fabs(sMainVC.view.center.x-kScreenCenterX);
            const CGFloat rightDistance = fabs(sMainVC.view.center.x-kScreenCenterX_Opened);
            [self openDrawerViewIf:leftDistance > rightDistance];
        }
        
    }
    
    
}

// move left
- (void)moveLeftWithTranslationX:(CGFloat)translationX{
    
    // max offset equal to sLeftLimit
    if (sMainVC.view.center.x >= kScreenCenterX - sLeftLimit) {
        sMainVC.view.center = [self offsetX:sLeftRatio * translationX fromOriginX:0];
    }
    
}
// move right
- (void)moveRightWithTranslationX:(CGFloat)translationX{
    
    // max offset equal to screen width or more
    if (sMainVC.view.center.x <= 4*kScreenCenterX) {
        // when drawer view is open
        if (sLeftViewOpen) {
            // main view move
            sMainVC.view.center = [self offsetX:translationX fromOriginX:kScreenW-sRightLimit];
            // drawer view move
            sDrawerVC.view.center = [self offsetX:translationX*sLeftLimit/kScreenW fromOriginX:0];
        }
        // when drawer view is close
        else {
            // main view move
            sMainVC.view.center = [self offsetX:translationX fromOriginX:0];
            // drawer view move
            sDrawerVC.view.center = [self offsetX:translationX*sLeftLimit/kScreenW fromOriginX:-sLeftLimit];
        }
    }
    
}

// move 'offset' from 'origin'
- (CGPoint)offsetX:(CGFloat)offset fromOriginX:(CGFloat)origin{
    
    const CGFloat newScreenX = kScreenCenterX + origin + offset;
    
    return CGPointMake(newScreenX, kScreenCenterY);
}

// open or close drawer view
- (void)openDrawerViewIf:(BOOL)open{
    
    [UIView animateWithDuration:0.38f delay:0 options:UIViewAnimationOptionCurveEaseOut  animations:^{
        sMainVC.view.center = CGPointMake(open ? kScreenCenterX_Opened:kScreenCenterX, kScreenCenterY);
        sDrawerVC.view.center = CGPointMake(open ? kScreenCenterX:(kScreenCenterX - sLeftLimit), kScreenCenterY);
    } completion:^(BOOL finished) {
        sLeftViewOpen = open;
    }];
    
}

#pragma mark warning

// show alert
- (void)showAlert{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告⚠️" message:@"主视图控制器或左侧抽屉视图控制器不能为空!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        NSLog(@"警告⚠️: 主视图控制器或左侧抽屉视图控制器不能为空!");
    });
}


#pragma mark static property

- (BOOL)enableGesture{
    return sEnable;
}

- (void)setEnableGesture:(BOOL)enableGesture{
    sEnable = enableGesture;
}


@end
