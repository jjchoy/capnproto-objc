//
//  CAPNCommon.m
//  capnproto
//
//  Created by Jason Choy on 12/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNCommon.h"

@implementation CAPNMessageSize

- (id)initWithMessageSize:(const capnp::MessageSize &)messageSize {
    return [self initWithWordCount:messageSize.wordCount capCount:messageSize.capCount];
}

- (id)initWithWordCount:(uint64_t)wordCount capCount:(NSUInteger)capCount {
    self = [super init];
    if (self) {
        _wordCount = wordCount;
        _capCount = capCount;
    }
    return self;
}

@end
