//
//  DLDPostController.h
//  OBJCReddit-Guided
//
//  Created by Deven Day on 9/30/20.
//

#import <Foundation/Foundation.h>
@class DLDPost;

NS_ASSUME_NONNULL_BEGIN

@interface DLDPostController : NSObject

+ (instancetype)shared;

- (void)fetchPostsWithSearchTerm:(NSString *)searchTerm
                      completion:(void (^) (NSArray<DLDPost *> *posts, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
