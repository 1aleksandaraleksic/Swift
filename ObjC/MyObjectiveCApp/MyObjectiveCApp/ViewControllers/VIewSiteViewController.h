//
//  VIewSiteViewController.h
//  MyObjectiveCApp
//
//  Created by aleksandar.aleksic on 16.7.21..
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VIewSiteViewController : UIViewController<WKNavigationDelegate>
{
    IBOutlet WKWebView *webView;
    IBOutlet UIActivityIndicatorView *activity;
    
}

@property(nonatomic, strong) IBOutlet WKWebView *webView;
@property(nonatomic, strong) IBOutlet UIActivityIndicatorView *activity;

@end

NS_ASSUME_NONNULL_END
