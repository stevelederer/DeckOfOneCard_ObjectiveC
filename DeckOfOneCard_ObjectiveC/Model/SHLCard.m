//
//  SHLCard.m
//  DeckOfOneCard_ObjectiveC
//
//  Created by Steve Lederer on 12/18/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import "SHLCard.h"

@implementation SHLCard

// MARK: - Initializers

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSArray *cards = dictionary[@"cards"];
        NSDictionary *cardDictionary = cards.firstObject;
        NSString *imageUrlAsString = cardDictionary[@"image"];
        _imageUrlString = imageUrlAsString;
    }
    return self;
}

@end
