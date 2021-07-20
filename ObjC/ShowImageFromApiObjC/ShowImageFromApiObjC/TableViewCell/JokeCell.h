//
//  JokeCell.h
//  ShowImageFromApiObjC
//
//  Created by aleksandar.aleksic on 16.7.21..
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JokeCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UILabel *setupLabel;
@property (strong, nonatomic) IBOutlet UILabel *punchlineLabel;

@end

NS_ASSUME_NONNULL_END
