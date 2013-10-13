//
//  gridView.m
//  MinimalUIImageLoad
//
//  Created by Antoine on 13/10/13.
//  Copyright (c) 2013 Antoine. All rights reserved.
//

#import "gridView.h"
#import "CellView.h"

@implementation gridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
-(void)handleLongPress:(UIPanGestureRecognizer *)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            self.vertex0 = [gesture locationInView:self];
            self.vertex1 = self.vertex0;
            //            NSLog(@"%@", NSStringFromCGPoint(self.vertex0));
            break;
        case UIGestureRecognizerStateChanged:
            self.vertex1=[gesture locationInView:self];
            //            NSLog(@"%@", NSStringFromCGPoint(self.vertex1));
            break;
        default:
            break;
    }
    [self adjustSelectionFrame];
    
}

-(void)  updateCellsInSelection {
    for (UIView * v in [self subviews]) {
        if ([v isKindOfClass:[CellView class]]) {
            [(CellView *)v setSelected: CGRectIntersectsRect(self.selectionLayer.frame, v.frame)];
        }
    }
}

-(void) adjustSelectionFrame {
    CGRect selectionFrame = CGRectStandardize(CGRectMake(self.vertex0.x, self.vertex0.y, self.vertex1.x-self.vertex0.x, self.vertex1.y-self.vertex0.y));
    [CATransaction begin];
    [CATransaction setAnimationDuration:0];
    [self.selectionLayer setFrame:selectionFrame];
    
    [self updateCellsInSelection];
    
    [CATransaction commit];
    
}
- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        self.selectionLayer = [[CALayer alloc] init];
        self.selectionLayer.backgroundColor  =[ UIColor whiteColor].CGColor;
        self.selectionLayer.opacity=0.5;
        self.selectionLayer.bounds=CGRectZero;
        [self.layer addSublayer:self.selectionLayer];
        
        CGRect boundsForCell = CGRectInset(self.bounds, 200, 200);
        
        for (int i=0; i<10; i++) {
            CellView * v = [[CellView alloc] init];
            [self addSubview:v];
            [v moveTo:CGPointMake(arc4random_uniform(boundsForCell.size.width), arc4random_uniform(boundsForCell.size.height))];
        }
        
    }
    return self;
}



@end
