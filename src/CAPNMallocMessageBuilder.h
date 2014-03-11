//
//  CAPNMallocMessageBuilder.h
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CAPNMessageBuilderBase.h"

@interface CAPNMallocMessageBuilder : CAPNMessageBuilderBase

- (id)init;
- (id)initWithFirstSegmentWords:(NSUInteger)firstSegmentWords;
- (id)initWithFirstSegmentWords:(NSUInteger)firstSegmentWords allocationStrategy:(CAPNAllocationStrategy)allocationStrategy;

@end
