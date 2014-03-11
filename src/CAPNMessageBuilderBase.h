//
//  CAPNMallocMessageBuilderBase.h
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CAPNMessageBuilder.h"

#ifdef __cplusplus
namespace capnp {
    class MessageBuilder;
}
#endif

@interface CAPNMessageBuilderBase : NSObject <CAPNMessageBuilder>

#ifdef __cplusplus

- (id)initWithMessageBuilder:(capnp::MessageBuilder *)messageBuilder;

#endif

- (void)dealloc;

@end
