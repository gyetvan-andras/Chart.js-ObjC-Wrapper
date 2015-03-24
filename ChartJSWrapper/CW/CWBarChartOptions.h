//
//  CWBarChartOptions.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWGlobalOptions.h"

@interface CWBarChartOptions : CWGlobalOptions
//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
@property (nonatomic) CWBoolean* scaleBeginAtZero;// : true,

//Boolean - Whether grid lines are shown across the chart
@property (nonatomic) CWBoolean* scaleShowGridLines;// : true,

//String - Colour of the grid lines
@property (nonatomic,strong) CWColor* scaleGridLineColor;// : "rgba(0,0,0,.05)",

//Number - Width of the grid lines
@property (nonatomic,strong) NSNumber* scaleGridLineWidth;// : 1,

//Boolean - Whether to show horizontal lines (except X axis)
@property (nonatomic) CWBoolean* scaleShowHorizontalLines;//: true,

//Boolean - Whether to show vertical lines (except Y axis)
@property (nonatomic) CWBoolean* scaleShowVerticalLines;//: true,

//Boolean - If there is a stroke on each bar
@property (nonatomic) CWBoolean* barShowStroke;// : true,

//Number - Pixel width of the bar stroke
@property (nonatomic,strong) NSNumber* barStrokeWidth;// : 2,

//Number - Spacing between each of the X value sets
@property (nonatomic,strong) NSNumber* barValueSpacing;// : 5,

//Number - Spacing between data sets within X values
@property (nonatomic,strong) NSNumber* barDatasetSpacing;// : 1,

//String - A legend template
@property (nonatomic,strong) NSString* legendTemplate;// r : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

@end
