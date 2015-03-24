//
//  CWBarChart.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWLineChart.h"
#import "CWBarChartData.h"
#import "CWBarChartOptions.h"
@interface CWBarChart : CWLineChart
- (instancetype) initWithWebView:(CWWebView*)webview name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(CWBarChartData*)data options:(CWBarChartOptions*) options;

@end
