//
//  CWLineChart.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWChart.h"
#import "CWLineChartData.h"
#import "CWLineChartOptions.h"

@interface CWLineChart : CWChart
- (instancetype) initWithWebView:(CWWebView*)webview name:(NSString*)name width:(NSInteger)w height:(NSInteger)h data:(CWLineChartData*)data options:(CWLineChartOptions*) options;
- (void) setValue:(NSNumber*)val inDataset:(NSInteger)dataset at:(NSInteger)data;
- (void) addData:(NSArray*)values label:(NSString*)label;
- (void) removeData;
@end
