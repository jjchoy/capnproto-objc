//
//  CAPNAnyPointer.h
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus

#include <capnp/any.h>

#endif

@interface CAPNAnyPointerReader : NSObject

#ifdef __cplusplus
- (id)initWithReader:(capnp::AnyPointer::Reader *)reader;
#endif

- (void)dealloc;

@end

@interface CAPNAnyPointerBuilder : NSObject

#ifdef __cplusplus
- (id)initWithBuilder:(capnp::AnyPointer::Builder *)builder;
#endif

- (void)dealloc;

@end
