//
//  SHLCard.h
//  DeckOfOneCard_ObjectiveC
//
//  Created by Steve Lederer on 12/18/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHLCard : NSObject

// MARK: - Properties

@property (nonatomic, strong) NSString *imageUrlString;

// MARK: - initializer

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
