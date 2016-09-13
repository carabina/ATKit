//
//  UIImage+ATEnhance.m
//  ATFoundation
//
//  Created by Aesir Titan on 2016-08-28.
//  Copyright © 2016 Titan Studio. All rights reserved.
//

#import "UIImage+ATExtension.h"
//#import "Foundation+ATLogExtension.h"

@implementation UIImage (ATExtension)


#pragma mark - load image

+ (UIImage *)at_imageWithBundleImageName:(NSString *)name{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    if (!path) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"jpg"];
    }
    if (!path) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"jpeg"];
    }
    if (!path) {
        // ATLogFail(@"resource named \"%@\".png or \"%@\".jpg not found!",name,name);
    }
    return [UIImage imageWithContentsOfFile:path];
}

+ (NSArray<UIImage *> *)at_imageWithBundleImageName:(NSString *)name count:(NSUInteger)count{
    NSMutableArray<UIImage *> *array = [NSMutableArray array];
    for (int i=0; i<count; i++) {
        name = [name stringByAppendingFormat:@"%d",i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
        if (!path) {
            path = [[NSBundle mainBundle] pathForResource:name ofType:@"jpg"];
        }
        if (!path) {
            path = [[NSBundle mainBundle] pathForResource:name ofType:@"jpeg"];
        }
        if (!path) {
            // ATLogFail(@"resource named \"%@\".png or \"%@\".jpg not found!",name,name);
        }
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        if (image) {
            [array addObject:image];
        }
    }
    if (array.count) {
        return array;
    } else{
        return nil;
    }
}

- (UIImage *)at_roundedImage{
    
    // begin context
    UIGraphicsBeginImageContext(self.size);
    // context ref
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // add a circle
    CGFloat min = fmin(self.size.width, self.size.height);
    CGRect rect = CGRectMake(0.5*(self.size.width-min), 0.5*(self.size.height-min), min, min);
    CGContextAddEllipseInRect(ctx, rect);
    // clip
    CGContextClip(ctx);
    // draw
    [self drawInRect:rect];
    // get circle image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // close context
    UIGraphicsEndImageContext();
    return image;

}


+ (UIImage *)at_imageWithColor:(UIColor *)color size:(CGSize)size alpha:(float)alpha{
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAlpha(context, alpha);
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (UIImage *)at_blurEffectWithFactor:(CGFloat)factor {
    
    CIImage * ciImage = [[CIImage alloc]initWithImage:self];
    CIFilter* blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:ciImage forKey:kCIInputImageKey];
    [blurFilter setValue:@(factor) forKey:@"inputRadius"];
    CIImage* outImage = [blurFilter valueForKey:kCIOutputImageKey];
    CIContext * context = [CIContext contextWithOptions:nil];
    CGImageRef outCGImage = [context createCGImage:outImage fromRect:[outImage extent]];
    UIImage* blurImage = [UIImage imageWithCGImage:outCGImage];
    CGImageRelease(outCGImage);
    
    return blurImage;
}

- (void)at_blurEffectWithFactor:(CGFloat)factor completion:(void (^)(UIImage *image))completion {
    UIImage *image = [self at_blurEffectWithFactor:factor];
    completion(image);
}

@end
