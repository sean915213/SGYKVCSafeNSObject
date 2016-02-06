
//
//  JSONCreatableObject.h
//  SGYSwiftJSON
//
//  Created by Sean Young on 9/17/15.
//  Copyright © 2015 Sean Young. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
extern NSString* const SGYKVCSafeErrorDomain;
extern NSString* const SGYKVCSafeErrorUserInfoExceptionKey;
extern int const SGYKVCSafeErrorSetValueExceptionCode;
extern int const SGYKVCSafeErrorGetValueExceptionCode;
NS_ASSUME_NONNULL_END

@interface NSObject (SGYKVCSafeNSObject)

-(nullable id)valueForKey:(nonnull NSString*)key error:(NSError* _Nullable * _Nullable)error;

-(nullable id)valueForKeyPath:(nonnull NSString*)key error:(NSError* _Nullable * _Nullable)error;

-(void)setValue:(nullable id)value forKey:(nonnull NSString*)key error:(NSError* _Nullable * _Nullable)error;

-(void)setValue:(nullable id)value forKeyPath:(nonnull NSString*)key error:(NSError* _Nullable * _Nullable)error;

@end
