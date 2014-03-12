//
//  CAPNMallocMessageBuilderBase.m
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNMessageBuilder.h"
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

- (CAPNDynamicStructBuilder *)initialiseRootDynamicStruct:(CAPNStructSchema *)schema {
    return [[CAPNDynamicStructBuilder alloc] initWithBuilder:self.messageBuilder->initRoot<capnp::DynamicStruct>(schema.schema)];
}

- (void)setRootFromDynamicStruct:(CAPNDynamicStructReader *)value {
    self.messageBuilder->setRoot(value.reader);
}

- (CAPNDynamicStructBuilder *)getRootAsDynamicStruct:(CAPNStructSchema *)schema {
    return [[CAPNDynamicStructBuilder alloc] initWithBuilder:self.messageBuilder->getRoot<capnp::DynamicStruct>(schema.schema)];
}

@end
