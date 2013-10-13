//
//  CellView.h
//  MinimalUIImageLoad
//
//  Created by Antoine on 13/10/13.
//  Copyright (c) 2013 Antoine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellView : UIView
@property (nonatomic) bool selected;
@property UIImageView * imageView;
-(void) moveTo:(CGPoint)p;

@end
