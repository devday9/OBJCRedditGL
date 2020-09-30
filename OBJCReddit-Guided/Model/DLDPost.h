//
//  DLDPost.h
//  OBJCReddit-Guided
//
//  Created by Deven Day on 9/30/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLDPost : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger ups;
@property (nonatomic, readonly) NSInteger commentCount;

- (instancetype)initWithTitle:(NSString *)title
                          ups:(NSInteger )ups
                 commentCount:(NSInteger )commentCount;

@end

@interface DLDPost (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


NS_ASSUME_NONNULL_END
