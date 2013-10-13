//
//  CellView.m
//  MinimalUIImageLoad
//
//  Created by Antoine on 13/10/13.
//  Copyright (c) 2013 Antoine. All rights reserved.
//

#import "CellView.h"

@implementation CellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.bounds= CGRectMake(0, 0, 100, 100);
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];

        [self addSubview:self.imageView];
    }
    return self;
}


-(void)setSelected:(bool)selected {
//    self.backgroundColor = selected? [UIColor blackColor] : [UIColor whiteColor];
    
    if (selected) {

    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//            UIImage * img = [UIImage imageNamed:@"wood.png"];
//            UIImage * img = [UIImage imageNamed:@"bois.jpg"];
            UIImage * img = [UIImage imageNamed:@"bois.png"];
            
            // Make a trivial (1x1) graphics context, and draw the image into it
            UIGraphicsBeginImageContext(CGSizeMake(1,1));
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextDrawImage(context, CGRectMake(0, 0, 1, 1), [img CGImage]);
            UIGraphicsEndImageContext();
            
            // Now the image will have been loaded and decoded and is ready to rock for the main thread
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.imageView setImage: img];
            });
        });
    
    
    }
    else [self.imageView setImage:nil];
    
    _selected=selected;

}

-(void)moveTo:(CGPoint)p {
    [CATransaction begin];
    [CATransaction setAnimationDuration:0];
    self.frame = CGRectMake(p.x, p.y, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    [CATransaction commit];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
