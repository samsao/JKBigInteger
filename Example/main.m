//
//  main.m
//  JKInteger
//
//  Created by Jānis Kiršteins on 7/10/13.
//  Copyright (c) 2013 Jānis Kiršteins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKBigDecimal.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        JKBigInteger *int1 = [[JKBigInteger alloc] initWithString:@"5"];

        NSLog(@"%@ + %@ = %@", int1, int1, [int1 add:int1]);

        //Diffie–Hellman
        JKBigInteger *int2 = [[JKBigInteger alloc] initWithString:@"33333333333333333333333333333333" andRadix:16];
        JKBigInteger *int3 = [[JKBigInteger alloc] initWithString:@"752da4c3a7e3d18979162a09486e5ed3" andRadix:16];
        JKBigInteger *int7 = [JKBigInteger generateRandomBigNumber];
        NSLog(@"%@ ^ %@ %% %@ = %@", int1, int2, int3, [[int1 pow:int7 andMod:int3] stringValueWithRadix:16]);
        
        //////////
        
        NSLog(@"%@ - %@ = %@", int2, int3, [int2 subtract:int3]);
        
        JKBigInteger *int4 = [[JKBigInteger alloc] initWithString:@"11111111111111111111"];

        NSLog(@"%@ * %@ = %@", int4, int4, [int4 multiply:int4]);
        
        JKBigInteger *int5 = [[JKBigInteger alloc] initWithString:@"10000001234567890123123123123"];
        JKBigInteger *int6 = [[JKBigInteger alloc] initWithString:@"123"];

        NSLog(@"%@ / %@ = %@", int5, int6, [int5 divide:int6]);
        
        unsigned int numBytesInt5 = [int5 countBytes];
        unsigned char bytes[numBytesInt5];
        
        [int5 toByteArrayUnsigned:bytes];
        
        for(unsigned i = 0; i < numBytesInt5; i++)
        {
            NSLog(@"Byte %d: %X", i, bytes[i]);
        }
        
        JKBigDecimal *dec1 = [[JKBigDecimal alloc] initWithString:@"2015.987"];
        JKBigDecimal *dec2 = [[JKBigDecimal alloc] initWithString:@"5.4"];
        NSLog(@"%@ + %@ = %@", dec1, dec2, [dec1 add:dec2]);
        NSLog(@"%@ - %@ = %@", dec1, dec2, [dec1 subtract:dec2]);
        NSLog(@"%@ * %@ = %@", dec1, dec2, [dec1 multiply:dec2]);
        NSLog(@"%@ / %@ = %@", dec1, dec2, [dec1 divide:dec2]);
        NSLog(@"%@ %% %@ = %@", dec1, dec2, [dec1 remainder:dec2]);
        
        JKBigDecimal *dec3 = [[JKBigDecimal alloc] initWithString:@"0.99"];
        NSLog(@"%@ pow 365 = %@", dec3, [dec3 pow:365]);
        
    }
    return 0;
}
