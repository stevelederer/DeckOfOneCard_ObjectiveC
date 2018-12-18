//
//  SHLCardController.h
//  DeckOfOneCard_ObjectiveC
//
//  Created by Steve Lederer on 12/18/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHLCard.h"
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface SHLCardController : NSObject

// MARK: - Methods

+ (void) drawCardWithCompletion:(void (^) (SHLCard * _Nullable))completion;

+ (void) fetchCardImageWithCard: (SHLCard *)card
                     completion: (void (^) (UIImage* _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
