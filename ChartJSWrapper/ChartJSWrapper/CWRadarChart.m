//
//  CWRadarChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWRadarChart.h"

@implementation CWRadarChart
- (instancetype) init {
	return [super init];
}

- (void) addChart {
	NSString* dataJSON = [self.data JSON];
	NSString* optJSON = [self.options JSON];
	
	NSArray* params = @[self.name,@(self.width),@(self.height),dataJSON,optJSON];
	
	id res = [self.win callWebScriptMethod:@"addRadarChart" withArguments:params];
	
	NSLog(@"Result is:%@",res);
}

@end
