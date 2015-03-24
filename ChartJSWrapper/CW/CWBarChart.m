//
//  CWBarChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWBarChart.h"
@interface CWBarChart ()
@property (nonatomic, strong,readonly) CWBarChartData* data;
@property (nonatomic, strong, readonly) CWBarChartOptions* options;
@end

@implementation CWBarChart
- (instancetype) initWithWebView:(CWWebView*)webview name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(CWBarChartData*)data options:(CWBarChartOptions*) options {
	self = [super initWithWebView:webview name:name width:w height:h];
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
	
	[self callJavaScriptMethod:@"addBarChart" withArguments:params];
}

- (void) setValue:(NSNumber*)val inDataset:(NSInteger)dataset at:(NSInteger)data {
	[_data setValue:val inDataset:dataset at:data];
	NSArray* params = @[self.name,@(dataset),@(data),val];
	
	[self callJavaScriptMethod:@"setBarValue" withArguments:params];
}

@end
