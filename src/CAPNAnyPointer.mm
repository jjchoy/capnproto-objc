//
//  CAPNAnyPointer.m
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNAnyPointer.h"

@interface CAPNAnyPointerReader ()

@property (readonly) capnp::AnyPointer::Reader *reader;

@end

@interface CAPNAnyPointerBuilder ()

@property (readonly) capnp::AnyPointer::Builder *builder;

@end

@implementation CAPNAnyPointerReader

- (id)initWithReader:(capnp::AnyPointer::Reader *)reader {
    self = [super init];
    if (self) {
        _reader = reader;
    }
    return self;
}

- (void)dealloc {
    delete self.reader;
}

@end

@implementation CAPNAnyPointerBuilder

- (id)initWithBuilder:(capnp::AnyPointer::Builder *)builder {
    self = [super init];
    if (self) {
        _builder = builder;
    }
    return self;
}

- (void)dealloc {
    delete self.builder;
}

@end