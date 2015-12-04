//
//  PageAppViewController.h
//  PageApp
//
//  Created by matata on 9/18/13.
//  Copyright (c) 2013 matata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentViewController.h"

@interface PageAppViewController : UIViewController
<UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) NSArray *pageContent;


@end
