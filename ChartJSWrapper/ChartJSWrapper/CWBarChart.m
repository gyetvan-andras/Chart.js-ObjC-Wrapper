//
//  CWBarChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWBarChart.h"

@implementation CWBarChart
- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(CWBarChartData*)data options:(CWBarChartOptions*) options {
	self = [super initWithWindowScriptObject:win name:name width:w height:h];
	if(self) {
		_data = data;
		_options = options;
		if(!_options) {
			_options = [[CWBarChartOptions alloc] init];
		}
	}
	return self;
}

- (void) addChart {
	NSString* dataJSON = [self.data JSON];
	NSString* optJSON = [self.options JSON];
	
	NSArray* params = @[self.name,@(self.width),@(self.height),dataJSON,optJSON];
	
	id res = [self.win callWebScriptMethod:@"addBarChart" withArguments:params];
	
	NSLog(@"Result is:%@",res);
}

- (void) setValue:(NSNumber*)val inDataset:(NSInteger)dataset at:(NSInteger)data {
	[_data setValue:val inDataset:dataset at:data];
	NSArray* params = @[self.name,@(dataset),@(data),val];
	
	id res = [self.win callWebScriptMethod:@"setBarValue" withArguments:params];
	
	NSLog(@"Result setBarValue is:%@",res);
}

@end
