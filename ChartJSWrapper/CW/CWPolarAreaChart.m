//
//  CWPolarAreaChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWPolarAreaChart.h"

@interface CWPolarAreaChart ()
@property (nonatomic, strong,readonly) NSArray* data;
@property (nonatomic, strong, readonly) CWPolarAreaChartOptions* options;
@end

@implementation CWPolarAreaChart
- (instancetype) initWithWebView:(CWWebView*)webview name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(NSArray*)data options:(CWPolarAreaChartOptions*) options {
	self = [super initWithWebView:webview name:name width:w height:h];
	if(self) {
		_data = [NSMutableArray arrayWithArray:data];
		_options = options;
		if(!_options) {
			_options = [[CWPolarAreaChartOptions alloc] init];
		}
	}
	return self;
}

- (void) addChart {
	id jsonData = [self convertToJSON:_data];
	NSString* dataJSON = [CWObject toJSONString:jsonData];
	NSString* optJSON = [self.options JSON];
//	NSLog(@"Polar data:%@",dataJSON);
	
	NSArray* params = @[self.name,@(self.width),@(self.height),dataJSON,optJSON];
	
	[self callJavaScriptMethod:@"addPolarAreaChart" withArguments:params];
}

//myPolarAreaChart.segments[1].value = 10;
- (void) setValue:(NSNumber*)val inSegment:(NSInteger)segment {
	NSMutableArray* arr = (NSMutableArray*)_data;
	arr[segment] = val;
//	[_data setValue:val ];
	NSArray* params = @[self.name,@(segment),val];
	
	[self callJavaScriptMethod:@"setSegmentValue" withArguments:params];
}

- (void) addData:(CWSegmentData*)data index:(NSNumber*)index {
	id jsonData = [self convertToJSON:data];
	NSString* dataJSON = [CWObject toJSONString:jsonData];
	NSArray* params = @[self.name,dataJSON,index];
	
	[self callJavaScriptMethod:@"addSegmentData" withArguments:params];
}

- (void) removeDataAt:(NSNumber*)index {
	NSArray* params = @[self.name,index];
	
	[self callJavaScriptMethod:@"removeSegmentData" withArguments:params];
}

@end
