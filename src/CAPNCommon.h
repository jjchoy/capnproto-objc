//
//  CAPNCommon.h
//  capnproto
//
//  Created by Jason Choy on 12/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus

#include <capnp/common.h>

#endif

@interface CAPNMessageSize : NSObject

#ifdef __cplusplus

- (id)initWithMessageSize:(const capnp::MessageSize&)messageSize;

#endif

- (id)initWithWordCount:(uint64_t)wordCount capCount:(NSUInteger)capCount;

@property (readonly) uint64_t wordCount;
@property (readonly) NSUInteger capCount;

@end
