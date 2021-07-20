//
//  ViewController.m
//  ShowImageFromApiObjC
//
//  Created by aleksandar.aleksic on 16.7.21..
//

#import "ViewController.h"
#import "Joke.h"
#import "JokeCell.h"

@interface ViewController ()

@property NSMutableArray<Joke *> *jokeArray;
@property NSMutableArray<UIImage *> *imageArray;

@end

@implementation ViewController
@synthesize jokesTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchImageUsingJSON];
    
    _jokeArray = NSMutableArray.new;
    _imageArray = NSMutableArray.new;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _jokeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Joke *joke = [_jokeArray objectAtIndex:indexPath.row];
    
    JokeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];

    cell.setupLabel.text = joke.setup;
    cell.punchlineLabel.text = joke.punchline;
    cell.typeLabel.text = joke.type;
    
    return  cell;
}

- (void) fetchImageUsingJSON{
    NSLog(@"Fetching images");
    NSString *urlString = @"https://official-joke-api.appspot.com/random_ten";
    NSURL *url = [NSURL URLWithString:urlString];

    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Finished fetching courses..");
        
        NSString *dummyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"dummy string: %@", dummyString);
        NSError *err;
        
       NSArray *jokeJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err){
            NSLog(@"Faild to serialize into JSON: %@", err);
            return;
        }
        
        NSMutableArray<Joke *> *jokes = NSMutableArray.new;
        
        for(NSDictionary *jokeDict in jokeJSON){
            
            Joke *joke = Joke.new;
            joke.type = jokeDict[@"type"];;
            joke.setup = jokeDict[@"setup"];
            joke.punchline = jokeDict[@"punchline"];
            
            [jokes addObject:joke];
        }
        
        self.jokeArray = jokes;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.jokesTableView reloadData];
        });
        
        }] resume];
}

@end
