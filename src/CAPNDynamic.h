//
//  CAPNDynamicStruct.h
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus

#include <capnp/dynamic.h>

#endif

typedef NS_ENUM(NSUInteger, CAPNDynamicValueType) {
    CAPNDynamicValueTypeUnknown,
    CAPNDynamicValueTypeVoid,
    CAPNDynamicValueTypeBool,
    CAPNDynamicValueTypeInt,
    CAPNDynamicValueTypeUInt,
    CAPNDynamicValueTypeFloat,
    CAPNDynamicValueTypeText,
    CAPNDynamicValueTypeData,
    CAPNDynamicValueTypeList,
    CAPNDynamicValueTypeEnum,
    CAPNDynamicValueTypeStruct,
    CAPNDynamicValueTypeCapability,
    CAPNDynamicValueTypeAnyPointer
};

@class CAPNDynamicEnum;
@class CAPNDynamicStructReader;
@class CAPNDynamicStructBuilder;
@class CAPNDynamicListReader;
@class CAPNDynamicListBuilder;

@interface CAPNDynamicValueReader : NSObject

#ifdef __cplusplus

- (id)initWithReader:(capnp::DynamicValue::Reader&&)reader;

#endif

@property (readonly) CAPNDynamicValueType type;

@property (readonly) BOOL boolValue;
@property (readonly) uint8_t uint8Value;
@property (readonly) uint16_t uint16Value;
@property (readonly) uint32_t uint32Value;
@property (readonly) uint64_t uint64Value;
@property (readonly) int8_t int8Value;
@property (readonly) int16_t int16Value;
@property (readonly) int32_t int32Value;
@property (readonly) int64_t int64Value;
@property (readonly) float floatValue;
@property (readonly) double doubleValue;
@property (readonly) CAPNDynamicEnum *enumValue;
@property (readonly) CAPNDynamicStructReader *structValue;
@property (readonly) CAPNDynamicListReader *listValue;

@end

@interface CAPNDynamicValueBuilder : NSObject

#ifdef __cplusplus

- (id)initWithReader:(capnp::DynamicValue::Builder&&)builder;

#endif

@property (readonly) CAPNDynamicValueType type;

@property (readwrite) BOOL boolValue;
@property (readwrite) uint8_t uint8Value;
@property (readwrite) uint16_t uint16Value;
@property (readwrite) uint32_t uint32Value;
@property (readwrite) uint64_t uint64Value;
@property (readwrite) int8_t int8Value;
@property (readwrite) int16_t int16Value;
@property (readwrite) int32_t int32Value;
@property (readwrite) int64_t int64Value;
@property (readwrite) float floatValue;
@property (readwrite) double doubleValue;
@property (readonly) CAPNDynamicEnum *enumValue;
@property (readonly) CAPNDynamicStructBuilder *structValue;
@property (readonly) CAPNDynamicListBuilder *listValue;

@end

@interface CAPNDynamicEnum : NSObject

#ifdef __cplusplus

- (id)initWithEnum:(capnp::DynamicEnum&&)dynamicEnum;

#endif

@property (readonly) uint16_t rawValue;

@end

@interface CAPNDynamicStructReader : NSObject

#ifdef __cplusplus

- (id)initWithReader:(capnp::DynamicStruct::Reader&&)reader;

#endif

@end

@interface CAPNDynamicStructBuilder : NSObject

#ifdef __cplusplus

- (id)initWithBuilder:(capnp::DynamicStruct::Builder&&)builder;

#endif

@end

@interface CAPNDynamicListReader : NSObject

#ifdef __cplusplus

- (id)initWithReader:(capnp::DynamicList::Reader&&)reader;

#endif

@end

@interface CAPNDynamicListBuilder : NSObject

#ifdef __cplusplus

- (id)initWithBuilder:(capnp::DynamicList::Builder&&)builder;

#endif

@end