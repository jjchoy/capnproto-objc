//
//  CAPNSchema.h
//  capnproto
//
//  Created by Jason Choy on 11/03/2014.
//  Copyright (c) 2014 Jason Choy. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus

#include <capnp/schema.h>

#endif

@class CAPNDynamicValueReader;

@class CAPNStructSchema;
@class CAPNStructSchemaField;
@class CAPNStructSchemaFieldList;
@class CAPNStructSchemaFieldSubset;

@class CAPNEnumSchema;
@class CAPNEnumerant;
@class CAPNEnumerantList;

@class CAPNInterfaceSchema;
@class CAPNConstSchema;

@class CAPNListSchema;

@interface CAPNSchema : NSObject

#ifdef __cplusplus

- (id)initWithSchema:(capnp::Schema&&)schema;

#endif

- (CAPNSchema *)getDependency:(uint64_t)dependencyId;

@property (readonly) CAPNStructSchema *asStruct;
@property (readonly) CAPNEnumSchema *asEnum;
@property (readonly) CAPNInterfaceSchema *asInterface;
@property (readonly) CAPNConstSchema *asConst;

@end

@interface CAPNStructSchema : NSObject

#ifdef __cplusplus

- (id)initWithSchema:(capnp::StructSchema&&)schema;

#endif

@property (readonly) CAPNStructSchemaFieldList *fields;
@property (readonly) CAPNStructSchemaFieldSubset *unionFields;
@property (readonly) CAPNStructSchemaFieldSubset *nonUnionFields;

- (CAPNStructSchemaField *)findFieldByName:(NSString *)name;
- (CAPNStructSchemaField *)getFieldByDiscriminant:(uint16_t)discriminant;

@end

@interface CAPNStructSchemaField : NSObject

#ifdef __cplusplus

- (id)initWithField:(capnp::StructSchema::Field&&)field;

#endif

@property (readonly) CAPNStructSchema *containingStruct;
@property (readonly) NSUInteger index;
@property (readonly) uint32_t defaultValueSchemaOffset;

@end

@interface CAPNStructSchemaFieldList : NSObject

#ifdef __cplusplus

- (id)initWithFieldList:(capnp::StructSchema::FieldList&&)fieldList;

#endif

@property (readonly) NSUInteger count;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end

@interface CAPNStructSchemaFieldSubset : NSObject

#ifdef __cplusplus

- (id)initWithFieldSubset:(capnp::StructSchema::FieldSubset&&)fieldSubset;

#endif

@property (readonly) NSUInteger count;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end

@interface CAPNEnumSchema : NSObject

#ifdef __cplusplus

- (id)initWithSchema:(capnp::EnumSchema&&)schema;

#endif

@property (readonly) CAPNEnumerantList *enumerants;
- (CAPNEnumerant *)findEnumerantByName:(NSString *)name;

@end

@interface CAPNEnumerant : NSObject

#ifdef __cplusplus

- (id)initWithEnumerant:(capnp::EnumSchema::Enumerant&&)enumerant;

#endif

@property (readonly) CAPNEnumSchema *containingEnum;
@property (readonly) uint16_t ordinal;
@property (readonly) NSUInteger index;

@end

@interface CAPNEnumerantList : NSObject

#ifdef __cplusplus

- (id)initWithEnumerantList:(capnp::EnumSchema::EnumerantList&&)enumerantList;

#endif

- (NSUInteger)count;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end

@interface CAPNInterfaceSchema : NSObject

// Not Yet Implemented

#ifdef __cplusplus

- (id)initWithSchema:(capnp::InterfaceSchema&&)schema;

#endif

@end

@interface CAPNConstSchema : NSObject

#ifdef __cplusplus

- (id)initWithSchema:(capnp::ConstSchema&&)schema;

#endif

@property (readonly) CAPNDynamicValueReader *value;
@property (readonly) uint32_t valueSchemaOffset;

@end

@interface CAPNListSchema : NSObject

#ifdef __cplusplus

- (id)initWithSchema:(capnp::ListSchema&&)schema;

#endif

// TODO

@end