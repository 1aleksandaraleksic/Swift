//
//  ViewController.h
//  ShowImageFromApiObjC
//
//  Created by aleksandar.aleksic on 16.7.21..
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *jokesTableView;


@end

