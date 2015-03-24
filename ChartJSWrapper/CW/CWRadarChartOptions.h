//
//  CWRadarChartOptions.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 22/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWGlobalOptions.h"

@interface CWRadarChartOptions : CWGlobalOptions
//Boolean - Whether to show lines for each scale point
@property (nonatomic) CWBoolean* scaleShowLine;// : true,

//Boolean - Whether we show the angle lines out of the radar
@property (nonatomic) CWBoolean* angleShowLineOut;// : true,

//Boolean - Whether to show labels on the scale
@property (nonatomic) CWBoolean* scaleShowLabels;// : false,

// Boolean - Whether the scale should begin at zero
@property (nonatomic) CWBoolean* scaleBeginAtZero;// : true,

//String - Colour of the angle line
@property (nonatomic,strong) CWColor* angleLineColor;// : "rgba(0,0,0,.1)",

//Number - Pixel width of the angle line
@property (nonatomic,strong) NSNumber* angleLineWidth;// : 1,

//String - Point label font declaration
@property (nonatomic,strong) NSString* pointLabelFontFamily;// : "'Arial'",

//String - Point label font weight
@property (nonatomic,strong) NSString* pointLabelFontStyle;// : "normal",

//Number - Point label font size in pixels
@property (nonatomic,strong) NSNumber* pointLabelFontSize;// : 10,

//String - Point label font colour
@property (nonatomic,strong) CWColor* pointLabelFontColor;// : "#666",

//Boolean - Whether to show a dot for each point
@property (nonatomic) CWBoolean* pointDot;// : true,

//Number - Radius of each point dot in pixels
@property (nonatomic,strong) NSNumber* pointDotRadius;// : 3,

//Number - Pixel width of point dot stroke
@property (nonatomic,strong) NSNumber* pointDotStrokeWidth;// : 1,

//Number - amount extra to add to the radius to cater for hit detection outside the drawn point
@property (nonatomic,strong) NSNumber* pointHitDetectionRadius;// : 20,

//Boolean - Whether to show a stroke for datasets
@property (nonatomic) CWBoolean* datasetStroke;// : true,

//Number - Pixel width of dataset stroke
@property (nonatomic,strong) NSNumber* datasetStrokeWidth;// : 2,

//Boolean - Whether to fill the dataset with a colour
@property (nonatomic) CWBoolean* datasetFill;// : true,

//String - A legend template
@property (nonatomic,strong) NSString* legendTemplate;// : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

@end
