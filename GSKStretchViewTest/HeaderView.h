//
//  HeaderView.h
//  GSKStretchViewTest
//
//  Created by LandToSky on 12/4/16.
//  Copyright © 2016 LandToSky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GSKStretchyHeaderView.h>
@interface HeaderView : GSKStretchyHeaderView

@property(nonatomic, strong) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *view;

@end
