//
//  CAPNSchema.m
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNSchema.h"
#import "CAPNDynamic.h"

#include <utility>

@interface CAPNSchema ()

@property (readonly) capnp::Schema schema;

@end

@interface CAPNStructSchema ()

@property (readonly) capnp::StructSchema schema;

@end

@interface CAPNStructSchemaField ()

@end

@interface CAPNStructSchemaFieldList ()

@property (readonly) capnp::StructSchema::FieldList fieldList;

@end

@interface CAPNStructSchemaFieldSubset ()

@property (readonly) capnp::StructSchema::FieldSubset fieldSubset;

@end

@interface CAPNEnumSchema ()

@property (readonly) capnp::EnumSchema schema;

@end

@interface CAPNEnumerant ()

@property (readonly) capnp::EnumSchema::Enumerant enumerant;

@end

@interface CAPNEnumerantList ()

@property (readonly) capnp::EnumSchema::EnumerantList enumerantList;

@end

@interface CAPNInterfaceSchema ()

@end

@interface CAPNConstSchema ()

@property (readonly) capnp::ConstSchema schema;

@end

@interface CAPNListSchema ()

@property (readonly) capnp::ListSchema schema;

@end

@implementation CAPNSchema

- (id)initWithSchema:(capnp::Schema&&)schema {
    self = [super init];
    if (self) {
        _schema = std::move(schema);
    }
    return self;
}

- (CAPNSchema *)getDependency:(uint64_t)dependencyId {
    return [[CAPNSchema alloc] initWithSchema:self.schema.getDependency(dependencyId)];
}

- (CAPNStructSchema *)asStruct {
    return [[CAPNStructSchema alloc] initWithSchema:self.schema.asStruct()];
}

- (CAPNEnumSchema *)asEnum {
    return [[CAPNEnumSchema alloc] initWithSchema:self.schema.asEnum()];
}

- (CAPNInterfaceSchema *)asInterface {
    return [[CAPNInterfaceSchema alloc] initWithSchema:self.schema.asInterface()];
}

- (CAPNConstSchema *)asConst {
    return [[CAPNConstSchema alloc] initWithSchema:self.schema.asConst()];
}

@end

@implementation CAPNStructSchema

- (id)initWithSchema:(capnp::StructSchema &&)schema {
    self = [super init];
    if (self) {
        _schema = std::move(schema);
    }
    return self;
}

- (CAPNStructSchemaFieldList *)fields {
    return [[CAPNStructSchemaFieldList alloc] initWithFieldList:self.schema.getFields()];
}

- (CAPNStructSchemaFieldSubset *)unionFields {
    return [[CAPNStructSchemaFieldSubset alloc] initWithFieldSubset:self.schema.getUnionFields()];
}

- (CAPNStructSchemaFieldSubset *)nonUnionFields {
    return [[CAPNStructSchemaFieldSubset alloc] initWithFieldSubset:self.schema.getNonUnionFields()];
}

- (CAPNStructSchemaField *)findFieldByName:(NSString *)name {
    KJ_IF_MAYBE(field, self.schema.findFieldByName(kj::StringPtr([name UTF8String], [name lengthOfBytesUsingEncoding:NSUTF8StringEncoding]))) {
        return [[CAPNStructSchemaField alloc] initWithField:std::move(*field)];
    }
    return nil;
}

- (CAPNStructSchemaField *)getFieldByDiscriminant:(uint16_t)discriminant {
    KJ_IF_MAYBE(field, self.schema.getFieldByDiscriminant(discriminant)) {
        return [[CAPNStructSchemaField alloc] initWithField:std::move(*field)];
    }
    return nil;
}

@end

@implementation CAPNStructSchemaField

- (id)initWithField:(capnp::StructSchema::Field &&)field {
    self = [super init];
    if (self) {
        _field = std::move(field);
    }
    return self;
}

- (CAPNStructSchema *)containingStruct {
    return [[CAPNStructSchema alloc] initWithSchema:self.field.getContainingStruct()];
}

- (NSUInteger)index {
    return static_cast<NSUInteger>(self.field.getIndex());
}

- (uint32_t)defaultValueSchemaOffset {
    return self.field.getDefaultValueSchemaOffset();
}

@end

@implementation CAPNStructSchemaFieldList

- (id)initWithFieldList:(capnp::StructSchema::FieldList &&)fieldList {
    self = [super init];
    if (self) {
        _fieldList = std::move(fieldList);
    }
    return self;
}

- (NSUInteger)count {
    return self.fieldList.size();
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [[CAPNStructSchemaField alloc] initWithField:self.fieldList[index]];
}

@end

@implementation CAPNStructSchemaFieldSubset

- (id)initWithFieldSubset:(capnp::StructSchema::FieldSubset &&)fieldSubset {
    self = [super init];
    if (self) {
        _fieldSubset = std::move(fieldSubset);
    }
    return self;
}

- (NSUInteger)count {
    return self.fieldSubset.size();
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [[CAPNStructSchemaField alloc] initWithField:self.fieldSubset[index]];
}

@end

@implementation CAPNEnumSchema

- (id)initWithSchema:(capnp::EnumSchema &&)schema {
    self = [super init];
    if (self) {
        _schema = std::move(schema);
    }
    return self;
}

- (CAPNEnumerantList *)enumerants {
    return [[CAPNEnumerantList alloc] initWithEnumerantList:self.schema.getEnumerants()];
}

- (CAPNEnumerant *)findEnumerantByName:(NSString *)name {
    KJ_IF_MAYBE(enumerant, self.schema.findEnumerantByName(kj::StringPtr([name UTF8String], [name lengthOfBytesUsingEncoding:NSUTF8StringEncoding]))) {
        return [[CAPNEnumerant alloc] initWithEnumerant:std::move(*enumerant)];
    }
    return nil;
}

@end

@implementation CAPNEnumerant

- (id)initWithEnumerant:(capnp::EnumSchema::Enumerant &&)enumerant {
    self = [super init];
    if (self) {
        _enumerant = std::move(enumerant);
    }
    return self;
}

- (CAPNEnumSchema *)containingEnum {
    return [[CAPNEnumSchema alloc] initWithSchema:self.enumerant.getContainingEnum()];
}

- (uint16_t)ordinal {
    return self.enumerant.getOrdinal();
}

- (NSUInteger)index {
    return self.enumerant.getIndex();
}

@end

@implementation CAPNEnumerantList

- (id)initWithEnumerantList:(capnp::EnumSchema::EnumerantList &&)enumerantList {
    self = [super init];
    if (self) {
        _enumerantList = std::move(enumerantList);
    }
    return self;
}

- (NSUInteger)count {
    return self.enumerantList.size();
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [[CAPNEnumerant alloc] initWithEnumerant:self.enumerantList[index]];
}

@end

@implementation CAPNConstSchema

- (id)initWithSchema:(capnp::ConstSchema &&)schema {
    self = [super init];
    if (self) {
        _schema = std::move(schema);
    }
    return self;
}

- (CAPNDynamicValueReader *)value {
    return [[CAPNDynamicValueReader alloc] initWithReader:self.schema.as<capnp::DynamicValue>()];
}

- (uint32_t)valueSchemaOffset {
    return self.schema.getValueSchemaOffset();
}

@end

@implementation CAPNListSchema

- (id)initWithSchema:(capnp::ListSchema &&)schema {
    self = [super init];
    if (self) {
        _schema = std::move(schema);
    }
    return self;
}

- (CAPNSchemaType)elementType {
    return static_cast<CAPNSchemaType>(self.schema.whichElementType());
}

- (CAPNStructSchema *)structElementType {
    return [[CAPNStructSchema alloc] initWithSchema:self.schema.getStructElementType()];
}

- (CAPNEnumSchema *)enumElementType {
    return [[CAPNEnumSchema alloc] initWithSchema:self.schema.getEnumElementType()];
}

- (CAPNInterfaceSchema *)interfaceElementType {
    return [[CAPNInterfaceSchema alloc] initWithSchema:self.schema.getInterfaceElementType()];
}

- (CAPNListSchema *)listElementType {
    return [[CAPNListSchema alloc] initWithSchema:self.schema.getListElementType()];
}

@end