//
//  JSONCreatableObject.m
//  SGYSwiftJSON
//
//  Created by Sean Young on 9/17/15.
//  Copyright © 2015 Sean Young. All rights reserved.
//

#import "SGYKVCSafeNSObject.h"

NSString* const SGYKVCSafeErrorDomain = @"SGYKVCSafeNSObject";
NSString* const SGYKVCSafeErrorUserInfoExceptionKey = @"exception";

int const SGYKVCSafeErrorSetValueExceptionCode = 1;
int const SGYKVCSafeErrorGetValueExceptionCode = 2;

@implementation NSObject (SGYKVCSafeNSObject)

-(id)valueForKey:(NSString*)key error:(NSError**)error
{
    // Set value inside try/catch for extra safety
    @try {
        return [self valueForKey:key];
    } @catch (NSException* e) {
        if (error == nil) return nil;
        *error = [NSError errorWithDomain:SGYKVCSafeErrorDomain
                                     code:SGYKVCSafeErrorGetValueExceptionCode
                                 userInfo:@{ SGYKVCSafeErrorUserInfoExceptionKey: e }];
    }
}

-(id)valueForKeyPath:(NSString*)keyPath error:(NSError**)error
{
    // Set value inside try/catch for extra safety
    @try {
        return [self valueForKey:keyPath];
    } @catch (NSException* e) {
        if (error == nil) return nil;
        *error = [NSError errorWithDomain:SGYKVCSafeErrorDomain
                                     code:SGYKVCSafeErrorGetValueExceptionCode
                                 userInfo:@{ SGYKVCSafeErrorUserInfoExceptionKey: e }];
    }
}

-(void)setValue:(id)value forKey:(NSString*)key error:(NSError**)error
{
    // Set value inside try/catch for extra safety
    @try {
        [self setValue:value forKey:key];
    } @catch (NSException* e) {
        if (error == nil) return;
        *error = [NSError errorWithDomain:SGYKVCSafeErrorDomain
                                     code:SGYKVCSafeErrorSetValueExceptionCode
                                 userInfo:@{ SGYKVCSafeErrorUserInfoExceptionKey: e }];
    }
}

-(void)setValue:(id)value forKeyPath:(NSString *)keyPath error:(NSError *__autoreleasing  _Nullable *)error
{
    // Set value inside try/catch for extra safety
    @try {
        [self setValue:value forKeyPath:keyPath];
    } @catch (NSException* e) {
        if (error == nil) return;
        *error = [NSError errorWithDomain:SGYKVCSafeErrorDomain
                                     code:SGYKVCSafeErrorSetValueExceptionCode
                                 userInfo:@{ SGYKVCSafeErrorUserInfoExceptionKey: e }];
    }
}

@end
