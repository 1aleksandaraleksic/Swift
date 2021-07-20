//
//  JokeCell.m
//  ShowImageFromApiObjC
//
//  Created by aleksandar.aleksic on 16.7.21..
//

#import "JokeCell.h"

@implementation JokeCell
@synthesize typeLabel, setupLabel, punchlineLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
