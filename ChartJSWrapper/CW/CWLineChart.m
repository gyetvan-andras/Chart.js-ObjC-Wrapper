//
//  CWLineChart.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWLineChart.h"

@interface CWLineChart ()
@property (nonatomic, strong,readonly) CWLineChartData* data;
@property (nonatomic, strong, readonly) CWLineChartOptions* options;
@end

@implementation CWLineChart
- (instancetype) initWithWebView:(CWWebView*)webview name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(CWLineChartData*)data options:(CWLineChartOptions*) options {
	self = [super initWithWebView:webview name:name width:w height:h];
	if(self) {
		_data = data;
		_options = options;
		if(!_options) {
			_options = [[CWLineChartOptions alloc] init];
		}
	}
	return self;
}

- (void) addChart {
	NSString* dataJSON = [self.data JSON];
	NSString* optJSON = [self.options JSON];
	
	NSArray* params = @[self.name,@(self.width),@(self.height),dataJSON,optJSON];

	[self callJavaScriptMethod:@"addLineChart" withArguments:params];
}

- (void) setValue:(NSNumber*)val inDataset:(NSInteger)dataset at:(NSInteger)data {
	[_data setValue:val inDataset:dataset at:data];
	NSArray* params = @[self.name,@(dataset),@(data),val];
	
	[self callJavaScriptMethod:@"setPointValue" withArguments:params];
}

- (void) addData:(NSArray*)values label:(NSString*)label {
	NSMutableArray* safeArray = [NSMutableArray arrayWithArray:values];
	while (safeArray.count > self.data.datasets.count) {
		[safeArray removeLastObject];
	};
	id jsonValues = [self convertToJSON:safeArray];
	NSString* valuesJSON = [CWObject toJSONString:jsonValues];
	
	NSArray* params = @[self.name,valuesJSON,label];
	[self callJavaScriptMethod:@"addPointData" withArguments:params];
}

- (void) removeData {
	NSArray* params = @[self.name];
	[self callJavaScriptMethod:@"removePointData" withArguments:params];
}

@end
