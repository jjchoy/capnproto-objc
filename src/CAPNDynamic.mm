//
//  CAPNDynamicStruct.m
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNDynamic.h"

#include <utility>

@interface CAPNDynamicValueReader ()

@property (readonly) capnp::DynamicValue::Reader reader;

@end

@interface CAPNDynamicValueBuilder ()

@property (readwrite) capnp::DynamicValue::Builder builder;

@end

@interface CAPNDynamicEnum ()

@property (readonly) capnp::DynamicEnum dynamicEnum;

@end

@interface CAPNDynamicStructReader ()

@property (readonly) capnp::DynamicStruct::Reader reader;

@end

@interface CAPNDynamicStructBuilder ()

@property (readonly) capnp::DynamicStruct::Builder builder;

@end

@interface CAPNDynamicListReader ()

@property (readonly) capnp::DynamicList::Reader reader;

@end

@interface CAPNDynamicListBuilder ()

@property (readonly) capnp::DynamicList::Builder builder;

@end


@implementation CAPNDynamicValueReader

- (id)initWithReader:(capnp::DynamicValue::Reader&&)reader {
    self = [super init];
    if (self) {
        _reader = std::move(reader);
    }
    return self;
}

- (CAPNDynamicValueType)type {
    return static_cast<CAPNDynamicValueType>(self.reader.getType());
}

- (BOOL)boolValue {
    return self.reader.as<bool>();
}

- (uint8_t)uint8Value {
    return self.reader.as<uint8_t>();
}

- (uint16_t)uint16Value {
    return self.reader.as<uint16_t>();
}

- (uint32_t)uint32Value {
    return self.reader.as<uint32_t>();
}

- (uint64_t)uint64Value {
    return self.reader.as<uint64_t>();
}

- (int8_t)int8Value {
    return self.reader.as<int8_t>();
}

- (int16_t)int16Value {
    return self.reader.as<int16_t>();
}

- (int32_t)int32Value {
    return self.reader.as<int32_t>();
}

- (int64_t)int64Value {
    return self.reader.as<int64_t>();
}

- (float)floatValue {
    return self.reader.as<float>();
}

- (double)doubleValue {
    return self.reader.as<double>();
}

- (CAPNDynamicEnum *)enumValue {
    return [[CAPNDynamicEnum alloc] initWithEnum:self.reader.as<capnp::DynamicEnum>()];
}

- (CAPNDynamicStructReader *)structValue {
    return [[CAPNDynamicStructReader alloc] initWithReader:self.reader.as<capnp::DynamicStruct::Reader>()];
}

- (CAPNDynamicListReader *)listValue {
    return [[CAPNDynamicListReader alloc] initWithReader:self.reader.as<capnp::DynamicList::Reader>()];
}

@end

@implementation CAPNDynamicValueBuilder

- (id)initWithBuilder:(capnp::DynamicValue::Builder *)builder {
    self = [super init];
    if (self) {
        _builder = *builder;
    }
    return self;
}

- (CAPNDynamicValueType)type {
    return static_cast<CAPNDynamicValueType>(self.builder.getType());
}

- (BOOL)boolValue {
    return self.builder.as<bool>();
}

- (void)setBoolValue:(BOOL)boolValue {
    self.builder = static_cast<bool>(boolValue);
}

- (uint8_t)uint8Value {
    return self.builder.as<uint8_t>();
}

- (void)setUint8Value:(uint8_t)uint8Value {
    self.builder = uint8Value;
}

- (uint16_t)uint16Value {
    return self.builder.as<uint16_t>();
}

- (void)setUint16Value:(uint16_t)uint16Value {
    self.builder = uint16Value;
}

- (uint32_t)uint32Value {
    return self.builder.as<uint32_t>();
}

- (void)setUint32Value:(uint32_t)uint32Value {
    self.builder = uint32Value;
}

- (uint64_t)uint64Value {
    return self.builder.as<uint64_t>();
}

- (void)setUint64Value:(uint64_t)uint64Value {
    self.builder = uint64Value;
}

- (int8_t)int8Value {
    return self.builder.as<int8_t>();
}

- (void)setInt8Value:(int8_t)int8Value {
    self.builder = int8Value;
}

- (int16_t)int16Value {
    return self.builder.as<int16_t>();
}

- (void)setInt16Value:(int16_t)int16Value {
    self.builder = int16Value;
}

- (int32_t)int32Value {
    return self.builder.as<int32_t>();
}

- (void)setInt32Value:(int32_t)int32Value {
    self.builder = int32Value;
}

- (int64_t)int64Value {
    return self.builder.as<int64_t>();
}

- (void)setInt64Value:(int64_t)int64Value {
    self.builder = int64Value;
}

- (float)floatValue {
    return self.builder.as<float>();
}

- (void)setFloatValue:(float)floatValue {
    self.builder = floatValue;
}

- (double)doubleValue {
    return self.builder.as<double>();
}

- (void)setDoubleValue:(double)doubleValue {
    self.builder = doubleValue;
}

- (CAPNDynamicEnum *)enumValue {
    return [[CAPNDynamicEnum alloc] initWithEnum:self.builder.as<capnp::DynamicEnum>()];
}

- (CAPNDynamicStructBuilder *)structValue {
    return [[CAPNDynamicStructBuilder alloc] initWithBuilder:self.builder.as<capnp::DynamicStruct::Builder>()];
}

- (CAPNDynamicListBuilder *)listValue {
    return [[CAPNDynamicListBuilder alloc] initWithBuilder:self.builder.as<capnp::DynamicList::Builder>()];
}

@end

@implementation CAPNDynamicEnum

- (id)initWithEnum:(capnp::DynamicEnum&&)dynamicEnum {
    self = [super init];
    if (self) {
        _dynamicEnum = std::move(dynamicEnum);
    }
    return self;
}

- (CAPNEnumSchema *)schema {
    return [[CAPNEnumSchema alloc] initWithSchema:self.dynamicEnum.getSchema()];
}

- (CAPNEnumerant *)enumerant {
    KJ_IF_MAYBE(enumerant, self.dynamicEnum.getEnumerant()) {
        return [[CAPNEnumerant alloc] initWithEnumerant:std::move(*enumerant)];
    }
    return nil;
}

- (uint16_t)rawValue {
    return self.dynamicEnum.getRaw();
}

@end

@implementation CAPNDynamicStructReader

- (id)initWithReader:(capnp::DynamicStruct::Reader&&)reader {
    self = [super init];
    if (self) {
        _reader = std::move(reader);
    }
    return self;
}

- (CAPNStructSchema *)schema {
    return [[CAPNStructSchema alloc] initWithSchema:self.reader.getSchema()];
}

- (CAPNDynamicValueReader *)get:(CAPNStructSchemaField *)field {
    return [[CAPNDynamicValueReader alloc] initWithReader:self.reader.get(field.field)];
}

- (BOOL)has:(CAPNStructSchemaField *)field {
    return self.reader.has(field.field);
}

- (CAPNStructSchemaField *)which {
    KJ_IF_MAYBE(field, self.reader.which()) {
        return [[CAPNStructSchemaField alloc] initWithField:std::move(*field)];
    }
    return nil;
}

- (CAPNDynamicValueReader *)getByName:(NSString *)name {
    try {
        return [[CAPNDynamicValueReader alloc] initWithReader:self.reader.get(kj::StringPtr([name UTF8String], [name lengthOfBytesUsingEncoding:NSUTF8StringEncoding]))];
    } catch (...) {
        return nil;
    }
}

- (BOOL)hasByName:(NSString *)name {
    return self.reader.has(kj::StringPtr([name UTF8String], [name lengthOfBytesUsingEncoding:NSUTF8StringEncoding]));
}

@end

@implementation CAPNDynamicStructBuilder

- (id)initWithBuilder:(capnp::DynamicStruct::Builder&&)builder {
    self = [super init];
    if (self) {
        _builder = std::move(builder);
    }
    return self;
}

- (CAPNMessageSize *)totalSize {
    return [[CAPNMessageSize alloc] initWithMessageSize:self.builder.totalSize()];
}

- (CAPNStructSchema *)schema {
    return [[CAPNStructSchema alloc] initWithSchema:self.builder.getSchema()];
}

- (CAPNDynamicValueBuilder *)get:(CAPNStructSchemaField *)field {
    return [[CAPNDynamicValueBuilder alloc] initWithBuilder:self.builder.get(field.field)];
}

- (BOOL)has:(CAPNStructSchemaField *)field {
    return self.builder.has(field.field);
}

- (void)setValue:(CAPNDynamicValueReader *)value forField:(CAPNStructSchemaField *)field {
    self.builder.set(field.field, value.reader);
}

- (CAPNDynamicValueBuilder *)initialiseField:(CAPNStructSchemaField *)field {
    return [[CAPNDynamicValueBuilder alloc] initWithBuilder:self.builder.init(field.field)];
}

- (CAPNDynamicValueBuilder *)initialiseField:(CAPNStructSchemaField *)field count:(NSUInteger)count {
    return [[CAPNDynamicValueBuilder alloc] initWithBuilder:self.builder.init(field.field, count)];
}

- (void)clear:(CAPNStructSchemaField *)field {
    self.builder.clear(field.field);
}

- (CAPNDynamicStructReader *)asReader {
    return [[CAPNDynamicStructReader alloc] initWithReader:self.builder.asReader()];
}

@end

@implementation CAPNDynamicListReader

- (id)initWithReader:(capnp::DynamicList::Reader&&)reader {
    self = [super init];
    if (self) {
        _reader = std::move(reader);
    }
    return self;
}

- (CAPNListSchema *)schema {
    return [[CAPNListSchema alloc] initWithSchema:self.reader.getSchema()];
}

- (NSUInteger)count {
    return self.reader.size();
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [[CAPNDynamicValueReader alloc] initWithReader:self.reader[index]];
}

@end

@implementation CAPNDynamicListBuilder

- (id)initWithBuilder:(capnp::DynamicList::Builder&&)builder {
    self = [super init];
    if (self) {
        _builder = std::move(builder);
    }
    return self;
}

- (CAPNListSchema *)schema {
    return [[CAPNListSchema alloc] initWithSchema:self.builder.getSchema()];
}

- (NSUInteger)count {
    return self.builder.size();
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [[CAPNDynamicValueBuilder alloc] initWithBuilder:self.builder[index]];
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    NSAssert([obj isKindOfClass:[CAPNDynamicValueReader class]], @"setObject:atIndexedSubscript: can only be called with CAPNDynamicValueReader's");
    self.builder.set(idx, ((CAPNDynamicValueReader *)obj).reader);
}

- (void)initialiseIndex:(NSUInteger)index count:(NSUInteger)count {
    self.builder.init(index, count);
}

- (CAPNDynamicListReader *)asReader {
    return [[CAPNDynamicListReader alloc] initWithReader:self.builder.asReader()];
}

@end