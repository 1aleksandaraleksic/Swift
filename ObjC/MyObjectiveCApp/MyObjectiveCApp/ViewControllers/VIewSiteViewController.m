//
//  VIewSiteViewController.m
//  MyObjectiveCApp
//
//  Created by aleksandar.aleksic on 16.7.21..
//

#import "VIewSiteViewController.h"
#import "AppDelegate.h"

@interface VIewSiteViewController ()

@end

@implementation VIewSiteViewController
@synthesize webView, activity;

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [activity setHidden:NO];
    [activity startAnimating];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [activity setHidden:YES];
    [activity stopAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSURL *urlAddress = [NSURL URLWithString:mainDelegate.selectedURL];
    NSURLRequest *url = [NSURLRequest requestWithURL:urlAddress];
    [webView loadRequest:url];
    webView.navigationDelegate = self;
    
}



@end
