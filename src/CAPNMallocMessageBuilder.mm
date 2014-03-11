//
//  CAPNMallocMessageBuilder.m
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNMallocMessageBuilder.h"

#include <capnp/message.h>

@implementation CAPNMallocMessageBuilder

- (id)init {
    try {
        self = [super initWithMessageBuilder:(new capnp::MallocMessageBuilder)];
    } catch (...) {
        self = nil;
    }
    return self;
}

- (id)initWithFirstSegmentWords:(NSUInteger)firstSegmentWords {
    try {
        self = [super initWithMessageBuilder:(new capnp::MallocMessageBuilder(static_cast<uint>(firstSegmentWords)))];
    } catch (...) {
        self = nil;
    }
    return self;
}
- (id)initWithFirstSegmentWords:(NSUInteger)firstSegmentWords allocationStrategy:(CAPNAllocationStrategy)allocationStrategy {
    try {
        self = [super initWithMessageBuilder:(new capnp::MallocMessageBuilder(static_cast<uint>(firstSegmentWords), static_cast<capnp::AllocationStrategy>(allocationStrategy)))];
    } catch (...) {
        self = nil;
    }
    return self;
}

@end
