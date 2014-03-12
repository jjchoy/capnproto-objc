//
//  CAPNMallocMessageBuilderBase.h
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CAPNDynamic.h"
#import "CAPNSchema.h"

#ifdef __cplusplus
namespace capnp {
    class MessageBuilder;
}
#endif

typedef NS_ENUM(uint8_t, CAPNAllocationStrategy) {
    CAPNAllocationStrategyFixedSize,
    CAPNAllocationStrategyGrowHeuristically
};

@protocol CAPNMessageBuilder <NSObject>

// TODO needs type info
- (CAPNDynamicStructBuilder *)initialiseRootDynamicStruct:(CAPNStructSchema *)schema;
- (void)setRootFromDynamicStruct:(CAPNDynamicStructReader *)value;
- (CAPNDynamicStructBuilder *)getRootAsDynamicStruct:(CAPNStructSchema *)schema;

@end

@interface CAPNMessageBuilderBase : NSObject <CAPNMessageBuilder>

#ifdef __cplusplus

- (id)initWithMessageBuilder:(capnp::MessageBuilder *)messageBuilder;

#endif

@end
