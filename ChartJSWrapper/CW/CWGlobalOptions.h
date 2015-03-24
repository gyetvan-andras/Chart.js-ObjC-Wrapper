//
//  CWGlobalOptions.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 21/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "CWObject.h"
#import "CWBoolean.h"

@interface CWGlobalOptions : CWObject
// Boolean - Whether to animate the chart
@property (nonatomic) CWBoolean* animation;//: true,

// Number - Number of animation steps
@property (nonatomic,strong) NSNumber* animationSteps;//: 60,

// String - Animation easing effect
@property (nonatomic,strong) NSString* animationEasing;//: "easeOutQuart",

// Boolean - If we should show the scale at all
@property (nonatomic) CWBoolean* showScale;//: true,

// Boolean - If we want to override with a hard coded scale
@property (nonatomic) CWBoolean* scaleOverride;//: false,

// ** Required if scaleOverride is true **
// Number - The number of steps in a hard coded scale
@property (nonatomic,strong) NSNumber* scaleSteps;//: null,
// Number - The value jump in the hard coded scale
@property (nonatomic,strong) NSNumber* scaleStepWidth;//: null,
// Number - The scale starting value
@property (nonatomic,strong) NSNumber* scaleStartValue;//: null,

// String - Colour of the scale line
@property (nonatomic,strong) CWColor* scaleLineColor;//@property (nonatomic,strong) CWColor* : "rgba(0,0,0,.1)",

// Number - Pixel width of the scale line
@property (nonatomic,strong) NSNumber* scaleLineWidth;//: 1,

// Boolean - Whether to show labels on the scale
@property (nonatomic) CWBoolean* scaleShowLabels;//: true,

// Interpolated JS string - can access value
@property (nonatomic,strong) NSString* scaleLabel;//: "<%=value%>",

// Boolean - Whether the scale should stick to integers, not floats even if drawing space is there
@property (nonatomic) CWBoolean* scaleIntegersOnly;//: true,

// Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
@property (nonatomic) CWBoolean* scaleBeginAtZero;//: false,

// String - Scale label font declaration for the scale label
@property (nonatomic,strong) NSString* scaleFontFamily;//: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",

// Number - Scale label font size in pixels
@property (nonatomic,strong) NSNumber* scaleFontSize;//: 12,

// String - Scale label font weight style
@property (nonatomic,strong) NSString* scaleFontStyle;//: "normal",

// String - Scale label font colour
@property (nonatomic,strong) CWColor* scaleFontColor;//: "#666",

// Boolean - whether or not the chart should be responsive and resize when the browser does.
@property (nonatomic) CWBoolean* responsive;//: false,

// Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
@property (nonatomic) CWBoolean* maintainAspectRatio;//: true,

// Boolean - Determines whether to draw tooltips on the canvas or not
@property (nonatomic) CWBoolean* showTooltips;//: true,

// Function - Determines whether to execute the customTooltips function instead of drawing the built in tooltips (See [Advanced - External Tooltips](#advanced-usage-custom-tooltips))
@property (nonatomic) CWBoolean* customTooltips;//: false,

// Array - Array of string names to attach tooltip events
@property (nonatomic,strong) NSArray* tooltipEvents;//: ["mousemove", "touchstart", "touchmove"],

// String - Tooltip background colour
@property (nonatomic,strong) CWColor* tooltipFillColor;//: "rgba(0,0,0,0.8)",

// String - Tooltip label font declaration for the scale label
@property (nonatomic,strong) NSString* tooltipFontFamily;//: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",

// Number - Tooltip label font size in pixels
@property (nonatomic,strong) NSNumber* tooltipFontSize;//: 14,

// String - Tooltip font weight style
@property (nonatomic,strong) NSString* tooltipFontStyle;//: "normal",

// String - Tooltip label font colour
@property (nonatomic,strong) CWColor* tooltipFontColor;//: "#fff",

// String - Tooltip title font declaration for the scale label
@property (nonatomic,strong) NSString* tooltipTitleFontFamily;//: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",

// Number - Tooltip title font size in pixels
@property (nonatomic,strong) NSNumber* tooltipTitleFontSize;//: 14,

// String - Tooltip title font weight style
@property (nonatomic,strong) NSString* tooltipTitleFontStyle;//: "bold",

// String - Tooltip title font colour
@property (nonatomic,strong) CWColor* tooltipTitleFontColor;//: "#fff",

// Number - pixel width of padding around tooltip text
@property (nonatomic,strong) NSNumber* tooltipYPadding;//: 6,

// Number - pixel width of padding around tooltip text
@property (nonatomic,strong) NSNumber* tooltipXPadding;//: 6,

// Number - Size of the caret on the tooltip
@property (nonatomic,strong) NSNumber* tooltipCaretSize;//: 8,

// Number - Pixel radius of the tooltip border
@property (nonatomic,strong) NSNumber* tooltipCornerRadius;//: 6,

// Number - Pixel offset from point x to tooltip edge
@property (nonatomic,strong) NSNumber* tooltipXOffset;//: 10,

// String - Template string for single tooltips
@property (nonatomic,strong) NSString* tooltipTemplate;//: "<%if (label){%><%=label%>: <%}%><%= value %>",

// String - Template string for multiple tooltips
@property (nonatomic,strong) NSString* multiTooltipTemplate;//: "<%= value %>",

// Function - Will fire on animation progression.
//onAnimationProgress: function(){},

// Function - Will fire on animation completion.
//onAnimationComplete: function(){}
//}
@end
