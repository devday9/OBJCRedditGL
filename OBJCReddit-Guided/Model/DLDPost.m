//
//  DLDPost.m
//  OBJCReddit-Guided
//
//  Created by Deven Day on 9/30/20.
//

#import "DLDPost.h"

@implementation DLDPost

- (instancetype)initWithTitle:(NSString *)title ups:(NSInteger)ups commentCount:(NSInteger)commentCount
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _ups = ups;
        _commentCount = commentCount;
    }
    return self;
}

@end

@implementation DLDPost (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *dataDictionary = dictionary[@"data"];
    
    NSString *title = dataDictionary[@"title"];
    NSInteger ups = [dataDictionary[@"ups"] integerValue];
    NSInteger commentCount = [dataDictionary[@"num_comments"] integerValue];
    
    return  [self initWithTitle:title ups:ups commentCount:commentCount];
}

@end
