//
//  AppDelegate.m
//  KVCTest
//
//  Created by Nikolay Berlioz on 16.03.16.
//  Copyright © 2016 Nikolay Berlioz. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "Group.h"

@interface AppDelegate ()

//@property (strong, nonatomic) Student *student;
@property (strong, nonatomic) NSArray *groups;

@end

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    /*
     
     Student *student = [[Student alloc] init];
    
    [student addObserver:self forKeyPath:@"name"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    
    student.name = @"Alex";
    student.age = 20;
    
    NSLog(@"%@", student);
    NSLog(@"*****************************************");
    
    [student setValue:@"Roger" forKey:@"name"];
    [student setValue:[NSNumber numberWithInteger:25] forKey:@"age"];
    
    NSLog(@"*****************************************");
    
    NSLog(@"name1 = %@, name2 = %@", student.name, [student valueForKey:@"name"]);
    
    NSLog(@"%@", student);
    
    NSLog(@"*****************************************");
    
    self.student = student;
    
    [self.student changeName];
     
     */
    
    Student *student1 = [[Student alloc] init];
    student1.name = @"Alex";
    student1.age = 20;
    
    Student *student2 = [[Student alloc] init];
    student2.name = @"Roger";
    student2.age = 25;
    
    Student *student3 = [[Student alloc] init];
    student3.name = @"Jack";
    student3.age = 22;
    
    Student *student4 = [[Student alloc] init];
    student4.name = @"Vova";
    student4.age = 28;
    
    Group *group1 = [[Group alloc] init];
    group1.students = @[student1, student2, student3, student4];
    
    /*
    NSLog(@"%@", group1.students);
    
    NSMutableArray *array = [group1 mutableArrayValueForKey:@"students"];
    
    [array removeLastObject];
    
    NSLog(@"%@", array);
     */
    
    /*
    self.student = student1;
    
    NSString *name = @"Alex111";
    
    NSError *error = nil;
    
    if (![self.student validateValue:&name forKey:@"name" error:&error])
    {
        NSLog(@"%@", error);
    }
    */
    
    Student *student5 = [[Student alloc] init];
    student5.name = @"Vasya";
    student5.age = 18;
    
    Student *student6 = [[Student alloc] init];
    student6.name = @"Kolya";
    student6.age = 24;
    
    Group *group2 = [[Group alloc] init];
    group2.students = @[student5, student6];
    
    self.groups = @[group1, group2];
    
    NSLog(@"groups count %@", [self valueForKeyPath:@"groups.@count"]);
    
    NSArray *allStudents = [self.groups valueForKeyPath:@"@distinctUnionOfArrays.students"];
    
    NSLog(@"All Students = %@", allStudents);
    
    NSNumber *minAge = [allStudents valueForKeyPath:@"@min.age"];
    NSNumber *maxAge = [allStudents valueForKeyPath:@"@max.age"];
    NSNumber *sumAge = [allStudents valueForKeyPath:@"@sum.age"];
    NSNumber *avgAge = [allStudents valueForKeyPath:@"@avg.age"];
    
    NSLog(@"minAge = %@", minAge);
    NSLog(@"maxAge = %@", maxAge);
    NSLog(@"sumAge = %@", sumAge);
    NSLog(@"avgAge = %@", avgAge);
    
    
    NSArray *allNames = [allStudents valueForKeyPath:@"@distinctUnionOfObjects.name"];

    NSLog(@"allNames = %@", allNames);
    
    return YES;
}

- (void) dealloc
{
    //[self.student removeObserver:self forKeyPath:@"name"];
}

#pragma mark - Observing

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
