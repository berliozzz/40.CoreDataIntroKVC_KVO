//
//  Student.m
//  KVCTest
//
//  Created by Nikolay Berlioz on 17.03.16.
//  Copyright © 2016 Nikolay Berlioz. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void) changeName
{
    _name = @"FakeName";
}

- (void) setName:(NSString *)name
{
    _name = name;
    
    NSLog(@"student setName: %@", name);
}

- (void) setAge:(NSInteger)age
{
    _age = age;
    
    NSLog(@"student setAge: %ld", (long)age);
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"Student: %@ %ld", self.name, self.age];
}

- (void) setValue:(id)value forKey:(NSString *)key
{
    NSLog(@"Student setValue: %@ forKey: %@", value, key);
    
    [super setValue:value forKey:key];
}

- (void) setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"setValueForUndefinedKey");
}

- (id) valueForUndefinedKey:(NSString *)key
{
    NSLog(@"ValueForUndefinedKey");
    return nil;
}

/*
- (BOOL)validateValue:(inout id __nullable * __nonnull)ioValue forKey:(NSString *)inKey error:(out NSError **)outError
{
    if ([inKey isEqualToString:@"name"])
    {
        NSString *newName = *ioValue;
        
        if (![newName isKindOfClass:[NSString class]])
        {
            *outError = [[NSError alloc] initWithDomain:@"Not Nsstring" code:123 userInfo:nil];
            
            return NO;
        }
        
        if ([newName rangeOfString:@"1"].location != NSNotFound)
        {
            *outError = [[NSError alloc] initWithDomain:@"Has numbers" code:324 userInfo:nil];
            
            return NO;
        }
    }
    
    
    
    return YES;
}
*/

@end











