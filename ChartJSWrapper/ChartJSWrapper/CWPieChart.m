//
//  CWPieChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWPieChart.h"

@implementation CWPieChart
- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(NSArray*)data options:(CWPieChartOptions*) options {
	self = [super initWithWindowScriptObject:win name:name width:w height:h];
	if(self) {
		_data = [NSMutableArray arrayWithArray:data];
		_options = options;
		if(!_options) {
			_options = [[CWPieChartOptions alloc] init];
		}
	}
	return self;
}

- (void) addChart {
	id jsonData = [self convertToJSON:self.data];
	NSString* dataJSON = [CWObject toJSONString:jsonData];
	NSString* optJSON = [self.options JSON];
	
	NSArray* params = @[self.name,@(self.width),@(self.height),dataJSON,optJSON];
	
	id res = [self.win callWebScriptMethod:@"addPieChart" withArguments:params];
	
	NSLog(@"Result is:%@",res);
}

@end
