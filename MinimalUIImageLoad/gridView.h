//
//  gridView.h
//  MinimalUIImageLoad
//
//  Created by Antoine on 13/10/13.
//  Copyright (c) 2013 Antoine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gridView : UIView
-(void) handleLongPress:(UIPanGestureRecognizer *)gesture;

@property CALayer * selectionLayer;
@property CGPoint vertex0, vertex1;

@end
