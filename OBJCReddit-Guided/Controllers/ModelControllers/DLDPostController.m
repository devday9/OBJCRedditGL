//
//  DLDPostController.m
//  OBJCReddit-Guided
//
//  Created by Deven Day on 9/30/20.
//

#import "DLDPostController.h"
#import "DLDPost.h"

// https://www.reddit.com/r/funny/json

static NSString * const baseURLString = @"https://www.reddit.com/r";
static NSString * const jsonExtensionString = @"json";

@implementation DLDPostController

+ (instancetype)shared
{
    static DLDPostController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        shared = [[DLDPostController alloc] init];
    });
    return shared;
}

- (void)fetchPostsWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<DLDPost *> *, NSError * ))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:searchTerm];
    NSURL *finalURL = [searchURL URLByAppendingPathExtension:jsonExtensionString];
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error: %@, %@", error, error.localizedDescription);
            return completion(nil, error);
        }
        
        if (!data)
        {
            NSLog(@"There appears to be no data");
            return completion(nil, error);
        }
                 
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!topLevelDictionary)
        {
            NSLog(@"Error parsing JSON: %@", error);
            return completion(nil, error);
        }
        
        NSDictionary *postData = topLevelDictionary[@"data"];
        NSArray *childrenArray = postData[@"children"];
        
        NSMutableArray *postsArray = [NSMutableArray array];
        for (NSDictionary *dataDictonary in childrenArray)
        {
            DLDPost *post = [[DLDPost alloc] initWithDictionary:dataDictonary];
            [postsArray addObject:post];
        }
        completion(postsArray, nil);
    }] resume];
}

@end
