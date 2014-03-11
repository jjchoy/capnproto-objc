//
//  CAPNMallocMessageBuilderBase.m
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNMessageBuilderBase.h"
#include <capnp/message.h>

@interface CAPNMessageBuilderBase ()

@property (readonly) capnp::MessageBuilder *messageBuilder;

@end

@implementation CAPNMessageBuilderBase

- (id)initWithMessageBuilder:(capnp::MessageBuilder *)messageBuilder {
    self = [super init];
    if (self) {
        _messageBuilder = messageBuilder;
    }
    return self;
}

- (void)dealloc {
    delete self.messageBuilder;
}

@end
