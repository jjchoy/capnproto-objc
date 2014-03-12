//
//  CAPNSchema.m
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import "CAPNSchema.h"

#include <utility>

@interface CAPNSchema ()

@property (readonly) capnp::Schema schema;

@end

@interface CAPNStructSchema ()

@property (readonly) capnp::StructSchema schema;

@end

@interface CAPNStructSchemaField ()

@property (readonly) capnp::StructSchema::Field field;

@end

@interface CAPNStructSchemaFieldList ()

@property (readonly) capnp::StructSchema::FieldList fieldList;

@end

@interface CAPNEnumSchema ()

@end

@interface CAPNInterfaceSchema ()

@end

@interface CAPNConstSchema ()

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
    return static_cast<NSUInteger>(self.fieldList.size());
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [[CAPNStructSchemaField alloc] initWithField:self.fieldList[index]];
}

@end
