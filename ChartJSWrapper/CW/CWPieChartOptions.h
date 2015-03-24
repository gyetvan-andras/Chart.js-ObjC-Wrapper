//
//  CWPieChartOption.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWGlobalOptions.h"

@interface CWPieChartOptions : CWGlobalOptions
//Boolean - Whether we should show a stroke on each segment
@property (nonatomic) CWBoolean* segmentShowStroke;// : true,

//String - The colour of each segment stroke
@property (nonatomic) CWColor* segmentStrokeColor;// : "#fff",

//Number - The width of each segment stroke
@property (nonatomic) NSNumber* segmentStrokeWidth;// : 2,

//Number - The percentage of the chart that we cut out of the middle
@property (nonatomic) NSNumber* percentageInnerCutout;// : 50, // This is 0 for Pie charts

//Number - Amount of animation steps
@property (nonatomic) NSNumber* animationSteps;// : 100,

//String - Animation easing effect
@property (nonatomic) NSString* animationEasing;// : "easeOutBounce",

//Boolean - Whether we animate the rotation of the Doughnut
@property (nonatomic) CWBoolean* animateRotate;// : true,

//Boolean - Whether we animate scaling the Doughnut from the centre
@property (nonatomic) CWBoolean* animateScale;// : false,

//String - A legend template
@property (nonatomic) NSString* legendTemplate;// : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>"
@end
