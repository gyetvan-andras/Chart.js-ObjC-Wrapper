//
//  CWRadarChart.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWLineChart.h"
#import "CWRadarChartData.h"
#import "CWRadarChartOptions.h"

@interface CWRadarChart : CWLineChart
- (instancetype) initWithWebView:(CWWebView*)webview name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(CWRadarChartData*)data options:(CWRadarChartOptions*) options;
@end
