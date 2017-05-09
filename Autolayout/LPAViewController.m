//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero]; //PURPLE
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleBox];
    //[self.framingView sendSubviewToBack:purpleBox];
    
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];   //RED
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redBox];
    
    UIView *orangeBoxLeft = [[UIView alloc] initWithFrame:CGRectZero];  //ORANGE LEFT
    orangeBoxLeft.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxLeft.backgroundColor = [UIColor orangeColor];
    [self.framingView addSubview:orangeBoxLeft];
    [redBox addSubview:orangeBoxLeft];
    
    UIView *orangeBoxRight = [[UIView alloc] initWithFrame:CGRectZero]; //ORANGE RIGHT
    orangeBoxRight.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxRight.backgroundColor = [UIColor orangeColor];
    [self.framingView addSubview:orangeBoxRight];
    [redBox addSubview:orangeBoxRight];
    
    UIView *blueBoxTop = [[UIView alloc] initWithFrame:CGRectZero];  //BLUE TOP
    blueBoxTop.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxTop.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBoxTop];

    
    UIView *blueBoxMiddle = [[UIView alloc] initWithFrame:CGRectZero]; //BLUE MID
    blueBoxMiddle.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxMiddle.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBoxMiddle];
    [self.framingView bringSubviewToFront:blueBoxMiddle];
    
    UIView *blueBoxBottom = [[UIView alloc] initWithFrame:CGRectZero];  //BLUE BOTTOM
    blueBoxBottom.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxBottom.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBoxBottom];
    [self.framingView bringSubviewToFront:blueBoxBottom];
    

    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
    // Set up your views and constraints here
    //PURPLE
    NSLayoutConstraint *purpleBoxRightMargin = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                            attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    
    [self.view addConstraint:purpleBoxRightMargin];
    
    NSLayoutConstraint *purpleBoxBottomMargin = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                             attribute:NSLayoutAttributeBottom
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:framingView
                                                                             attribute:NSLayoutAttributeBottom
                                                                            multiplier:1.0
                                                                              constant:-20];
    
    [self.view addConstraint:purpleBoxBottomMargin];
    
    NSLayoutConstraint *purpleBoxSetWidth = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                       multiplier:305.0/500.0
                                                                         constant:0];
    
    [self.view addConstraint:purpleBoxSetWidth];
    
    NSLayoutConstraint *purpleBoxSetHeight = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1
                                                                           constant:50];
    [self.view addConstraint:purpleBoxSetHeight];
    
    //RED
    NSLayoutConstraint *redBoxTopMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                       attribute:NSLayoutAttributeTopMargin
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.framingView
                                                                       attribute:NSLayoutAttributeTopMargin
                                                                      multiplier:1
                                                                        constant:20];
    [self.view addConstraint:redBoxTopMargin];
    
    NSLayoutConstraint *redBoxRightMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                          attribute:NSLayoutAttributeRightMargin
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.framingView
                                                                          attribute:NSLayoutAttributeRightMargin
                                                                         multiplier:1
                                                                           constant:-20];
    [self.view addConstraint:redBoxRightMargin];

    //RED AND ORANGE
    NSLayoutConstraint *orangeRedLeft = [NSLayoutConstraint constraintWithItem:redBox
                                                                     attribute:NSLayoutAttributeLeft
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:orangeBoxLeft
                                                                     attribute:NSLayoutAttributeLeft
                                                                    multiplier:1
                                                                      constant:-8];
    [self.view addConstraint:orangeRedLeft];
    
    NSLayoutConstraint *redOrangeTop = [NSLayoutConstraint constraintWithItem:orangeBoxLeft
                                                                       attribute:NSLayoutAttributeTop
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:redBox
                                                                       attribute:NSLayoutAttributeTop
                                                                      multiplier:1
                                                                        constant:8];
    [self.view addConstraint:redOrangeTop];
    
    NSLayoutConstraint *orangeOrangeLeft = [NSLayoutConstraint constraintWithItem:orangeBoxRight
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:orangeBoxLeft
                                                                      attribute:NSLayoutAttributeRight
                                                                     multiplier:1
                                                                       constant:8];
    [self.view addConstraint:orangeOrangeLeft];
    
    NSLayoutConstraint *redOrangeRight = [NSLayoutConstraint constraintWithItem:orangeBoxRight
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:redBox
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1
                                                                        constant:-8];
    [self.view addConstraint:redOrangeRight];
    
    
    NSLayoutConstraint *orangeRedTop = [NSLayoutConstraint constraintWithItem:redBox
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:orangeBoxRight
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:-8];
    [self.view addConstraint:orangeRedTop];
    
    NSLayoutConstraint *orangeRedBottom = [NSLayoutConstraint constraintWithItem:redBox
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:orangeBoxLeft
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:8];
    [self.view addConstraint:orangeRedBottom];
    
    //ORANGE - right
    NSLayoutConstraint *orangeBoxRightSetWidth = [NSLayoutConstraint constraintWithItem:orangeBoxRight
                                                                              attribute:NSLayoutAttributeWidth
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1
                                                                               constant:50];
    
    [self.view addConstraint:orangeBoxRightSetWidth];
    
    NSLayoutConstraint *orangeBoxRightSetHeight = [NSLayoutConstraint constraintWithItem:orangeBoxRight
                                                                               attribute:NSLayoutAttributeHeight
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:nil
                                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                                              multiplier:1
                                                                                constant:30];
    [self.view addConstraint:orangeBoxRightSetHeight];
    //ORANGE -left
    NSLayoutConstraint *orangeBoxLeftSetWidth = [NSLayoutConstraint constraintWithItem:orangeBoxLeft
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1
                                                                              constant:70];
    [self.view addConstraint:orangeBoxLeftSetWidth];
    
    NSLayoutConstraint *orangeBoxLeftSetHeight = [NSLayoutConstraint constraintWithItem:orangeBoxLeft
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1
                                                                               constant:30];
    [self.view addConstraint:orangeBoxLeftSetHeight];
    
    //BLUE - top
    NSLayoutConstraint *blueBoxTopSetHeight = [NSLayoutConstraint constraintWithItem:blueBoxTop
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1
                                                                         constant:50];
    [self.view addConstraint:blueBoxTopSetHeight];
    
    NSLayoutConstraint *blueBoxTopSetWidth = [NSLayoutConstraint constraintWithItem:blueBoxTop
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:50];
    [self.view addConstraint:blueBoxTopSetWidth];
    
    NSLayoutConstraint *blueBoxTopCenterY = [NSLayoutConstraint constraintWithItem:blueBoxTop
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:0.5
                                                                          constant:0];
    [self.view addConstraint:blueBoxTopCenterY];
    
    NSLayoutConstraint *blueBoxTopCenterX = [NSLayoutConstraint constraintWithItem:blueBoxTop
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1
                                                                          constant:0];
    [self.view addConstraint:blueBoxTopCenterX];
    //BLUE - mid
    NSLayoutConstraint *blueBoxMidSetHeight = [NSLayoutConstraint constraintWithItem:blueBoxMiddle
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:blueBoxTop
                                                                           attribute:NSLayoutAttributeHeight
                                                                          multiplier:1
                                                                            constant:0];
    [self.view addConstraint:blueBoxMidSetHeight];
    
    NSLayoutConstraint *blueBoxMidSetWidth = [NSLayoutConstraint constraintWithItem:blueBoxMiddle
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:blueBoxTop
                                                                          attribute:NSLayoutAttributeWidth
                                                                         multiplier:1
                                                                           constant:0];
    [self.view addConstraint:blueBoxMidSetWidth];
    
    NSLayoutConstraint *blueBoxMidCenterY = [NSLayoutConstraint constraintWithItem:blueBoxMiddle
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1
                                                                          constant:0];
    [self.view addConstraint:blueBoxMidCenterY];
    
    
    NSLayoutConstraint *blueBoxMidCenterX = [NSLayoutConstraint constraintWithItem:blueBoxMiddle
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:blueBoxTop
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1
                                                                          constant:0];
    [self.view addConstraint:blueBoxMidCenterX];
    //BLUE - bottom
    NSLayoutConstraint *blueBoxBottomSetHeight = [NSLayoutConstraint constraintWithItem:blueBoxBottom
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:blueBoxTop
                                                                           attribute:NSLayoutAttributeHeight
                                                                          multiplier:1
                                                                            constant:0];
    [self.view addConstraint:blueBoxBottomSetHeight];
    
    NSLayoutConstraint *blueBoxBottomSetWidth = [NSLayoutConstraint constraintWithItem:blueBoxBottom
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:blueBoxTop
                                                                          attribute:NSLayoutAttributeWidth
                                                                         multiplier:1
                                                                           constant:0];
    [self.view addConstraint:blueBoxBottomSetWidth];
    
    NSLayoutConstraint *blueBoxBottomCenterY = [NSLayoutConstraint constraintWithItem:blueBoxBottom
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.5
                                                                          constant:0];
    [self.view addConstraint:blueBoxBottomCenterY];
    
    NSLayoutConstraint *blueBoxBottomCenterX = [NSLayoutConstraint constraintWithItem:blueBoxBottom
                                                                            attribute:NSLayoutAttributeCenterX
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:blueBoxTop
                                                                            attribute:NSLayoutAttributeCenterX
                                                                           multiplier:1
                                                                             constant:0];
    [self.view addConstraint:blueBoxBottomCenterX];


}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
