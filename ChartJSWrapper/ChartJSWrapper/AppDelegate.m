//
//  AppDelegate.m
//  ChartJSWrapper
//
//  Created by András Gyetván on 20/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "AppDelegate.h"
#import "CW.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet WebView *webview;
- (IBAction)addRadar:(id)sender;
- (IBAction)addLine:(id)sender;
- (IBAction)removeLine:(id)sender;
- (IBAction)changeLine:(id)sender;
- (IBAction)addBar:(id)sender;
- (IBAction)addPolarArea:(id)sender;
- (IBAction)addPie:(id)sender;
- (IBAction)addDoughnut:(id)sender;

- (IBAction)changePie:(id)sender;
- (IBAction)changeBar:(id)sender;
- (IBAction)delAddPie:(id)sender;

@property (nonatomic, strong) CWLineChart* lineChart;
@property (nonatomic, strong) CWPieChart* pieChart;
@property (nonatomic, strong) CWBarChart* barChart;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
//	[self.webview mainFrame] loadHTMLString:<#(NSString *)#> baseURL:<#(NSURL *)#>
	NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
	NSString *htmlPath = [resourcesPath stringByAppendingString:@"/cw.html"];
	[self.webview setUIDelegate: self];
	[self.webview setResourceLoadDelegate: self];
	[[self.webview mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]]];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}

- (void)webView:(WebView *)sender didClearWindowObject:(WebScriptObject *)windowObject forFrame:(WebFrame *)frame {
	
}

- (NSInteger) random:(NSInteger) max {
	return (NSInteger)arc4random_uniform((u_int32_t)max);
}

- (IBAction)addLine:(id)sender {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 4; i++) {
		CWPointDataSet* ds = [[CWPointDataSet alloc] initWithData:@[@([self random:100]),@([self random:100]),@([self random:100]),@([self random:100])]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		NSColor* c1 = [[CWColors sharedColors] pickColor];
		NSColor* c2 = [c1 colorWithAlphaComponent:0.5f];
		ds.fillColor = c2;
		ds.strokeColor = c1;
		[datasets addObject:ds];
	}
	id win = [self.webview windowScriptObject];
	
	CWLineChartData* lcd = [[CWLineChartData alloc] initWithLabels:labels andDataSet:datasets];
	self.lineChart = [[CWLineChart alloc] initWithWindowScriptObject:win name:@"LineChart1" width:600 height:250 data:lcd options:nil];
	[self.lineChart addChart];
}

- (IBAction)removeLine:(id)sender {
	[self.lineChart removeData];
	[self.lineChart addData:@[@([self random:100]),@([self random:100])/*,@([self random:100]),@([self random:100])*/] label:@"W"];
}

- (IBAction)changeLine:(id)sender {
	for(NSInteger i = 1; i < 4; i++) {
		[self.lineChart setValue:@([self random:100]) inDataset:i-1 at:0];
		[self.lineChart setValue:@([self random:100]) inDataset:i-1 at:1];
		[self.lineChart setValue:@([self random:100]) inDataset:i-1 at:2];
		[self.lineChart setValue:@([self random:100]) inDataset:i-1 at:3];
	}
	[self.lineChart update];
}

- (IBAction)addBar:(id)sender {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 4; i++) {
		CWBarDataSet* ds = [[CWBarDataSet alloc] initWithData:@[@([self random:100]+50),@([self random:100]+50),@([self random:100]+50),@([self random:100]+50)]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		NSColor* c1 = [[CWColors sharedColors] pickColor];
		NSColor* c2 = [c1 colorWithAlphaComponent:0.8f];
		ds.fillColor = c2;
		ds.strokeColor = c1;
		[datasets addObject:ds];
	}
	id win = [self.webview windowScriptObject];
	
	CWBarChartData* bcd = [[CWBarChartData alloc] initWithLabels:labels andDataSet:datasets];
	CWBarChart* bc = [[CWBarChart alloc] initWithWindowScriptObject:win name:@"BarChart1" width:600 height:250 data:bcd options:nil];
	[bc addChart];
	self.barChart = bc;
}

- (IBAction)addPolarArea:(id)sender {
	NSMutableArray* data = [NSMutableArray array];
	for(NSInteger i = 1; i < 11; i++) {
		CWSegmentData* segment = [[CWSegmentData alloc] init];
		segment.value = @([self random:100]+50);
		NSColor* c1 = [[CWColors sharedColors] pickColor];
		NSColor* c2 = [c1 colorWithAlphaComponent:0.8f];
		segment.color = c2;
		segment.highlight = c1;
		segment.label = [NSString stringWithFormat:@"Label %ld",i];
		[data addObject:segment];
	}
	id win = [self.webview windowScriptObject];
	CWPolarAreaChart* pac = [[CWPolarAreaChart alloc] initWithWindowScriptObject:win name:@"PAC1" width:300 height:300 data:data options:nil];
	[pac addChart];
}

- (IBAction)addPie:(id)sender {
	NSMutableArray* data = [NSMutableArray array];
	for(NSInteger i = 1; i < 11; i++) {
		CWSegmentData* segment = [[CWSegmentData alloc] init];
		segment.value = @([self random:100]+50);
		NSColor* c1 = [[CWColors sharedColors] pickColor];
		NSColor* c2 = [c1 colorWithAlphaComponent:0.8f];
		segment.color = c2;
		segment.highlight = c1;
		segment.label = [NSString stringWithFormat:@"Label %ld",i];
		[data addObject:segment];
	}
	id win = [self.webview windowScriptObject];
	CWPieChart* pc = [[CWPieChart alloc] initWithWindowScriptObject:win name:@"PIE1" width:300 height:300 data:data options:nil];
	[pc addChart];
	self.pieChart = pc;
}

- (IBAction)addDoughnut:(id)sender {
	NSMutableArray* data = [NSMutableArray array];
	for(NSInteger i = 1; i < 11; i++) {
		CWSegmentData* segment = [[CWSegmentData alloc] init];
		segment.value = @([self random:100]+50);
		NSColor* c1 = [[CWColors sharedColors] pickColor];
		NSColor* c2 = [c1 colorWithAlphaComponent:0.8f];
		segment.color = c2;
		segment.highlight = c1;
		segment.label = [NSString stringWithFormat:@"Label %ld",i];
		[data addObject:segment];
	}
	id win = [self.webview windowScriptObject];
	CWDoughnutChart* pc = [[CWDoughnutChart alloc] initWithWindowScriptObject:win name:@"Doughnut1" width:300 height:300 data:data options:nil];
	[pc addChart];
}

- (IBAction)changePie:(id)sender {
	for(NSInteger i = 1; i < 11; i++) {
		[self.pieChart setValue:@([self random:100]+50) inSegment:i-1];
	}
	[self.pieChart update];
}

- (IBAction)changeBar:(id)sender {
	for(NSInteger i = 1; i < 4; i++) {
		[self.barChart setValue:@([self random:100]+50) inDataset:i-1 at:0];
		[self.barChart setValue:@([self random:100]+50) inDataset:i-1 at:1];
		[self.barChart setValue:@([self random:100]+50) inDataset:i-1 at:2];
		[self.barChart setValue:@([self random:100]+50) inDataset:i-1 at:3];
	}
	[self.barChart update];
}

- (IBAction)delAddPie:(id)sender {
	[self.pieChart removeDataAt:@(1)];
	CWSegmentData* segment = [[CWSegmentData alloc] init];
	segment.value = @([self random:100]+50);
	NSColor* c = [[NSColor lightGrayColor] colorWithAlphaComponent:0.8f];
	segment.color = c;
	segment.highlight = [NSColor grayColor];
	segment.label = @"NEW SEGMENT";
	[self.pieChart addData:segment index:@(3)];
//	[self.lineChart addData:@[@([self random:100]),@([self random:100])/*,@([self random:100]),@([self random:100])*/] label:@"W"];
}

- (IBAction)addRadar:(id)sender {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 4; i++) {
		CWPointDataSet* ds = [[CWPointDataSet alloc] initWithData:@[@([self random:100]+50),@([self random:100]+50),@([self random:100]+50),@([self random:100]+50)]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		NSColor* c1 = [[CWColors sharedColors] pickColor];
		NSColor* c2 = [c1 colorWithAlphaComponent:0.5f];
		ds.fillColor = c2;
		ds.strokeColor = c1;
		[datasets addObject:ds];
	}
	id win = [self.webview windowScriptObject];
	
	CWRadarChartData* rcd = [[CWRadarChartData alloc] initWithLabels:labels andDataSet:datasets];
	CWRadarChart* rc = [[CWRadarChart alloc] initWithWindowScriptObject:win name:@"RadarChart1" width:600 height:300 data:rcd options:nil];
	[rc addChart];
}

@end
