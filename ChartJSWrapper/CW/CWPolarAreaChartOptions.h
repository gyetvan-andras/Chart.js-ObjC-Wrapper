//
//  CWPolarAreaChartOptions.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWGlobalOptions.h"

@interface CWPolarAreaChartOptions : CWGlobalOptions
//Boolean - Show a backdrop to the scale label
@property (nonatomic) CWBoolean* scaleShowLabelBackdrop;// : true,

//String - The colour of the label backdrop
@property (nonatomic,strong) CWColor* scaleBackdropColor;// : "rgba(255,255,255,0.75)",

// Boolean - Whether the scale should begin at zero
@property (nonatomic) CWBoolean* scaleBeginAtZero;// : true,

//Number - The backdrop padding above & below the label in pixels
@property (nonatomic,strong) NSNumber* scaleBackdropPaddingY;// : 2,

//Number - The backdrop padding to the side of the label in pixels
@property (nonatomic,strong) NSNumber* scaleBackdropPaddingX;// : 2,

//Boolean - Show line for each value in the scale
@property (nonatomic) CWBoolean* scaleShowLine;// : true,

//Boolean - Stroke a line around each segment in the chart
@property (nonatomic) CWBoolean* segmentShowStroke;// : true,

//String - The colour of the stroke on each segement.
@property (nonatomic,strong) CWColor* segmentStrokeColor;// : "#fff",

//Number - The width of the stroke value in pixels
@property (nonatomic,strong) NSNumber* segmentStrokeWidth;// : 2,

//Number - Amount of animation steps
@property (nonatomic,strong) NSNumber* animationSteps;// : 100,

//String - Animation easing effect.
@property (nonatomic,strong) NSString* animationEasing;//@property (nonatomic,strong) NSString*  : "easeOutBounce",

//Boolean - Whether to animate the rotation of the chart
@property (nonatomic) CWBoolean* animateRotate;// : true,

//Boolean - Whether to animate scaling the chart from the centre
@property (nonatomic) CWBoolean* animateScale;// : false,

//String - A legend template
@property (nonatomic,strong) NSString* legendTemplate;// : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul
@end
