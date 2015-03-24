//
//  CWLineChartOptions.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 21/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWGlobalOptions.h"

@interface CWLineChartOptions : CWGlobalOptions

///Boolean - Whether grid lines are shown across the chart
@property (nonatomic) CWBoolean* scaleShowGridLines;// : true,

//String - Colour of the grid lines
@property (nonatomic,strong) CWColor* scaleGridLineColor;// : "rgba(0,0,0,.05)",

//Number - Width of the grid lines
@property (nonatomic,strong) NSNumber* scaleGridLineWidth;// : 1,

//Boolean - Whether to show horizontal lines (except X axis)
@property (nonatomic) CWBoolean* scaleShowHorizontalLines;//: true,

//Boolean - Whether to show vertical lines (except Y axis)
@property (nonatomic) CWBoolean* scaleShowVerticalLines;//: true,

//Boolean - Whether the line is curved between points
@property (nonatomic) CWBoolean* bezierCurve;// : true,

//Number - Tension of the bezier curve between points
@property (nonatomic,strong) NSNumber* bezierCurveTension;// : 0.4,

//Boolean - Whether to show a dot for each point
@property (nonatomic) CWBoolean* pointDot;// : true,

//Number - Radius of each point dot in pixels
@property (nonatomic,strong) NSNumber* pointDotRadius;// : 4,

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
