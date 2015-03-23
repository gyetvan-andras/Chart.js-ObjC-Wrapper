//
//  CWRadarChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWRadarChart.h"

@interface CWRadarChart ()
@property (nonatomic, strong,readonly) CWRadarChartData* data;
@property (nonatomic, strong, readonly) CWRadarChartOptions* options;
@end

@implementation CWRadarChart
- (instancetype) initWithWindowScriptObject:(id) win name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(CWRadarChartData*)data options:(CWRadarChartOptions*) options {
	self = [super initWithWindowScriptObject:win name:name width:w height:h];
	if(self) {
		_data = data;
		_options = options;
		if(!_options) {
			_options = [[CWRadarChartOptions alloc] init];
		}
	}
	return self;
}

- (void) addChart {
	NSString* dataJSON = [self.data JSON];
	NSString* optJSON = [self.options JSON];
	
	NSArray* params = @[self.name,@(self.width),@(self.height),dataJSON,optJSON];
	
	id res = [self.win callWebScriptMethod:@"addRadarChart" withArguments:params];
	
	NSLog(@"Result is:%@",res);
}

@end
