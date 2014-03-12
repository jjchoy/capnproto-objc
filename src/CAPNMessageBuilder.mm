//
//  CAPNMallocMessageBuilderBase.m
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNMessageBuilder.h"
#include <capnp/message.h>

#include <utility>

@interface CAPNMessageBuilderBase () {
    kj::Own<capnp::MessageBuilder> _messageBuilder;
}

@end

@implementation CAPNMessageBuilderBase

- (id)initWithMessageBuilder:(kj::Own<capnp::MessageBuilder>&&)messageBuilder {
    self = [super init];
    if (self) {
        _messageBuilder = std::move(messageBuilder);
    }
    return self;
}

- (CAPNDynamicStructBuilder *)initialiseRootDynamicStruct:(CAPNStructSchema *)schema {
    return [[CAPNDynamicStructBuilder alloc] initWithBuilder:_messageBuilder->initRoot<capnp::DynamicStruct>(schema.schema)];
}

- (void)setRootFromDynamicStruct:(CAPNDynamicStructReader *)value {
    _messageBuilder->setRoot(value.reader);
}

- (CAPNDynamicStructBuilder *)getRootAsDynamicStruct:(CAPNStructSchema *)schema {
    return [[CAPNDynamicStructBuilder alloc] initWithBuilder:_messageBuilder->getRoot<capnp::DynamicStruct>(schema.schema)];
}

@end
