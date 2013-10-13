//
//  ViewController.m
//  MinimalUIImageLoad
//
//  Created by Antoine on 13/10/13.
//  Copyright (c) 2013 Antoine. All rights reserved.
//

#import "ViewController.h"
#import "gridView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *gridView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:(gridView *)self.gridView action:@selector(handleLongPress:)];
    [self.gridView addGestureRecognizer:longpress];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
