//
//  PageAppViewController.m
//  PageApp
//
//  Created by matata on 9/18/13.
//  Copyright (c) 2013 matata. All rights reserved.
//

#import "PageAppViewController.h"

@interface PageAppViewController ()

@end

@implementation PageAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createContentPages];
     NSDictionary *options = [NSDictionary dictionaryWithObject:
     [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]
     forKey: UIPageViewControllerOptionSpineLocationKey];

    _pageController = [[UIPageViewController alloc]
      initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
       options: options];

    _pageController.dataSource = self;
    [[_pageController view] setFrame:[[self view] bounds]];

    ContentViewController *initialViewController =
       [self viewControllerAtIndex:0];
    NSArray *viewControllers =
       [NSArray arrayWithObject:initialViewController];

    [_pageController setViewControllers:viewControllers
      direction:UIPageViewControllerNavigationDirectionForward
      animated:NO
      completion:nil];

    [self addChildViewController:_pageController];
    [[self view] addSubview:[_pageController view]];
    [_pageController didMoveToParentViewController:self];

}

- (void) createContentPages
{
    NSMutableArray *pageStrings = [[NSMutableArray alloc] init];
    for (int i = 1; i < 11; i++)
    {
        NSString *contentString = [[NSString alloc]
initWithFormat:@"<html><head></head><body><br><h1>Chapter %d</h1><p>This is the page %d of content displayed using UIPageViewController in iOS 7.</p></body></html>", i, i];
        [pageStrings addObject:contentString];
    }
    _pageContent = [[NSArray alloc] initWithArray:pageStrings];
}

- (ContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    // Return the data view controller for the given index.
    if (([self.pageContent count] == 0) ||
            (index >= [self.pageContent count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    /*
    ContentViewController *dataViewController =
        [[ContentViewController alloc] init];
    */

    UIStoryboard *storyboard = 
            [UIStoryboard storyboardWithName:@"Main" 
                 bundle:[NSBundle mainBundle]];

    ContentViewController *dataViewController = 
           [storyboard 
               instantiateViewControllerWithIdentifier:@"contentView"];

    dataViewController.dataObject = _pageContent[index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(ContentViewController *)viewController
{
     return [_pageContent indexOfObject:viewController.dataObject];
}

- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerBeforeViewController:
(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:
       (ContentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }

    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:
        (ContentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }

    index++;
    if (index == [self.pageContent count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
