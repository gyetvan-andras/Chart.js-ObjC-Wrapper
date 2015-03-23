//
//  CWChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWChart.h"
@interface CWChart ()
@end

@implementation CWChart
- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h {
	self = [super init];
	if(self) {
		_width = w;
		_height = h;
		_win = win;
		_name = [NSString stringWithString:name];
	}
	return self;
}

- (void) update {
	NSArray* params = @[self.name];
	id res = [self.win callWebScriptMethod:@"updateChart" withArguments:params];
	NSLog(@"Result - update is:%@",res);
}

- (void) removeChart {
	NSArray* params = @[self.name];
	id res = [self.win callWebScriptMethod:@"deleteChart" withArguments:params];
	NSLog(@"Result - deleteChart is:%@",res);
}

- (void) addChart {
//	NSString* dataJSON = [ls JSON];
//	id win = [self.webview windowScriptObject];
//	CWLineChartOptions* opt = [[CWLineChartOptions alloc] init];
//	NSString* optJSON = [opt JSON];
//	NSArray* params = @[@"myCanvas",@"600",@"250",dataJSON,optJSON];
//	
//	id res = [win callWebScriptMethod:@"addLineChart" withArguments:params];
//	
//	NSLog(@"Result is:%@",res);
	
}

@end
