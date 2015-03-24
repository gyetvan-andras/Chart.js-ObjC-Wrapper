//
//  CWPieChart.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWPolarAreaChart.h"
#import "CWPieChartOptions.h"
@interface CWPieChart : CWPolarAreaChart
@property (nonatomic, strong, readonly) CWPieChartOptions* options;
@property (nonatomic, strong,readonly) NSArray* data;
- (instancetype) initWithWebView:(CWWebView*)webview name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(NSArray*)data options:(CWPieChartOptions*) options;
//- (void) setValue:(NSNumber*)val inSegment:(NSInteger)segment;
@end
