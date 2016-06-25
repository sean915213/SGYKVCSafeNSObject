//
//  SGYKVCSafeNSObjectTests.m
//  SGYKVCSafeNSObjectTests
//
//  Created by Sean G Young on 02/05/2016.
//  Copyright (c) 2016 Sean G Young. All rights reserved.
//

// https://github.com/Specta/Specta

#import "SGYKVCSafeNSObject.h"

SharedExamplesBegin(MySharedExamples)
// Global shared examples are shared across all spec files.

sharedExamplesFor(@"error information", ^(NSDictionary *data) {
    NSError* err = data[@"error"];
    expect(err.domain).to.equal(SGYKVCSafeErrorDomain);
});

sharedExamplesFor(@"set value behavior", ^(NSDictionary *data) {
    itShouldBehaveLike(@"error information", data);
    expect(((NSError*)data[@"error"]).code).to.equal(SGYKVCSafeErrorSetValueExceptionCode);
});

sharedExamplesFor(@"get value behavior", ^(NSDictionary *data) {
    itShouldBehaveLike(@"error information", data);
    expect(((NSError*)data[@"error"]).code).to.equal(SGYKVCSafeErrorGetValueExceptionCode);
});

SharedExamplesEnd

SpecBegin(KeyValueTest)

describe(@"These should pass", ^{
    
    NSObject* obj = [NSObject new];
    __block NSError* err = nil;
    
    beforeEach(^{ err = nil; });
    
    it(@"should not crash", ^{
        [obj setValue:@"value" forKey:@"definitely not a key" error:&err];
        expect(err).willNot.beNil();
        NSDictionary* data = @{@"error" : err};
        itShouldBehaveLike(@"set value behavior", data);
    });
    
    it(@"should not crash", ^{
        [obj setValue:@"value" forKey:@"definitely not a keyPath" error:&err];
        expect(err).willNot.beNil();
        NSDictionary* data = @{@"error" : err};
        itShouldBehaveLike(@"set value behavior", data);
    });
    
    it(@"should not crash", ^{
        [obj valueForKey:@"not a key" error:&err];
        expect(err).willNot.beNil();
        NSDictionary* data = @{@"error" : err};
        itShouldBehaveLike(@"get value behavior", data);
    });
    
    it(@"should not crash", ^{
        [obj valueForKey:@"definitely not a keyPath" error:&err];
        expect(err).willNot.beNil();
        NSDictionary* data = @{@"error" : err};
        itShouldBehaveLike(@"get value behavior", data);
    });
});

SpecEnd

