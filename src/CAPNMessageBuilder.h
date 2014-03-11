//
//  CAPNMessageBuilder.h
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CAPNBuilder;
@class CAPNReader;

typedef NS_ENUM(uint8_t, CAPNAllocationStrategy) {
    CAPNAllocationStrategyFixedSize,
    CAPNAllocationStrategyGrowHeuristically
};

@protocol CAPNMessageBuilder <NSObject>

// TODO needs type info
- (id)initialiseRoot;
- (void)setRoot:(CAPNReader *)value;
- (id)getRoot;


@end
