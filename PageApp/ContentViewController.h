//
//  ContentViewController.h
//  PageApp
//
//  Created by matata on 9/18/13.
//  Copyright (c) 2013 matata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController
@property (strong, nonatomic) id dataObject;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
