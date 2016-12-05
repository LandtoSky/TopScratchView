//
//  ViewController.m
//  GSKStretchViewTest
//
//  Created by LandToSky on 12/4/16.
//  Copyright © 2016 LandToSky. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"

#import "GSKGradientView.h"
#import "UIView+GSKLayoutHelper.h"
//#import "GSKGeometry.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, GSKStretchyHeaderViewStretchDelegate>
{
    IBOutlet UITableView *mainTV;
    HeaderView *headerView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

- (void)initUI
{
    headerView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] firstObject];
    headerView.stretchDelegate = self;
        headerView.minimumContentHeight = 60;
    [mainTV addSubview:headerView];
    
}

- (void)initData
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleTableViewCell"];
    [cell.textLabel setText:[NSString stringWithFormat:@"%lu", indexPath.row]];
    return cell;
}

#pragma mark - Stretch Delegate
- (void)stretchyHeaderView:(HeaderView *)realHeaderView didChangeStretchFactor:(CGFloat)stretchFactor
{
//    [headerView.superclass didChangeStretchFactor:stretchFactor];
    CGFloat limitedStretchFactor = MIN(1, stretchFactor);
    
    CGSize minImageSize = CGSizeMake(300, 50);
    CGSize maxImageSize = CGSizeMake(375, 60);
    CGPoint minImageOrigin = CGPointMake(16, 2);
    CGPoint maxImageOrigin = CGPointMake(0, 135);

    realHeaderView.view.size = CGSizeInterpolate(limitedStretchFactor, minImageSize, maxImageSize);
    realHeaderView.view.left = CGFloatInterpolate(limitedStretchFactor, minImageOrigin.x, maxImageOrigin.x);
    realHeaderView.view.top = CGFloatInterpolate(stretchFactor, minImageOrigin.y, maxImageOrigin.y);
    
    if (stretchFactor < 1) {
           } else {
      
    }

}
@end
