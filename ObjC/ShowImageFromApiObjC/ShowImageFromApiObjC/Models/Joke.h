//
//  Joke.h
//  ShowImageFromApiObjC
//
//  Created by aleksandar.aleksic on 16.7.21..
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Joke : NSObject
//@property (nonatomic, copy) NSUUID *id;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *setup;
@property (nonatomic, strong) NSString *punchline;
@end

NS_ASSUME_NONNULL_END
