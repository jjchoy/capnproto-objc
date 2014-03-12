//
//  CAPNMallocMessageBuilder.m
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNMallocMessageBuilder.h"

#include <capnp/message.h>
#include <kj/memory.h>
#include <utility>

@interface CAPNMallocMessageBuilder ()

@end

@implementation CAPNMallocMessageBuilder

- (id)init {
    kj::Own<capnp::MessageBuilder> messagebuilder(new capnp::MallocMessageBuilder, kj::DestructorOnlyDisposer<capnp::MallocMessageBuilder>::instance);
    self = [super initWithMessageBuilder:std::move(messagebuilder)];
    if (self) {

    }
    return self;
}

- (id)initWithFirstSegmentWords:(NSUInteger)firstSegmentWords {
    kj::Own<capnp::MessageBuilder> messagebuilder(new capnp::MallocMessageBuilder(firstSegmentWords), kj::DestructorOnlyDisposer<capnp::MallocMessageBuilder>::instance);
    self = [super initWithMessageBuilder:std::move(messagebuilder)];
    if (self) {
        
    }
    return self;
}
- (id)initWithFirstSegmentWords:(NSUInteger)firstSegmentWords allocationStrategy:(CAPNAllocationStrategy)allocationStrategy {
    kj::Own<capnp::MessageBuilder> messagebuilder(new capnp::MallocMessageBuilder(firstSegmentWords, static_cast<capnp::AllocationStrategy>(allocationStrategy)), kj::DestructorOnlyDisposer<capnp::MallocMessageBuilder>::instance);
    self = [super initWithMessageBuilder:std::move(messagebuilder)];
    if (self) {
        
    }
    return self;
}

@end
