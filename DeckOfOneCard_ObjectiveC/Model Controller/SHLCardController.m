//
//  SHLCardController.m
//  DeckOfOneCard_ObjectiveC
//
//  Created by Steve Lederer on 12/18/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

#import "SHLCardController.h"
#import <UIKit/UIKit.h>

@implementation SHLCardController

// MARK: - Methods

+ (void)drawCardWithCompletion:(void (^)(SHLCard * _Nullable))completion
{
    //URL Should Look Like This: https://deckofcardsapi.com/api/deck/new/draw/?count=1
    
    NSURL *url = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
    
    NSLog(@"%@", url.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"🤬There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        if (data == nil) {
            NSLog(@"❌Couldn't get data back in drawCardWithCompletion");
            completion(nil);
            return;
        }
        
        NSDictionary *cardDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        SHLCard *card = [[SHLCard new]initWithDictionary:cardDictionary];
        completion(card);
    }]resume];
    
}

+ (void)fetchCardImageWithCard:(SHLCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL *imageUrl = [NSURL URLWithString:card.imageUrlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"🤬There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        if (data == nil) {
            NSLog(@"❌Couldn't get data back in drawCardWithCompletion");
            completion(nil);
            return;
        }
        
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }]resume];
}

@end
