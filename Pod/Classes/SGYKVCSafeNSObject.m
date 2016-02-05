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

@implementation NSObject (SGYKVCSafeNSObject)

-(void)trySetValue:(id)value forKey:(NSString*)key error:(NSError**)error
{
    // Set value inside try/catch for extra safety
    @try {
        [self setValue:value forKey:key];
    } @catch (NSException* e) {
        *error = [NSError errorWithDomain:SGYKVCSafeErrorDomain
                                     code:SGYKVCSafeErrorSetValueExceptionCode
                                 userInfo:@{ SGYKVCSafeErrorUserInfoExceptionKey: e }];
    }
}

@end
