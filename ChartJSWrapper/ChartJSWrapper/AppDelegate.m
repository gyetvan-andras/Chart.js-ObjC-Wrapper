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
- (IBAction)makeJSON:(id)sender;
- (IBAction)addRadar:(id)sender;
- (IBAction)addLine:(id)sender;
- (IBAction)removeLine:(id)sender;
- (IBAction)changeLine:(id)sender;
- (IBAction)addBar:(id)sender;
- (IBAction)addPolarArea:(id)sender;

@property (nonatomic, strong) CWLineChart* lineChart;
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
	int r = rand();
	float ir = (float)r/(float)RAND_MAX;
	return (NSInteger)(ir*(float)max) - 50;
}

- (IBAction)addLine:(id)sender {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 4; i++) {
		CWPointDataSet* ds = [[CWPointDataSet alloc] initWithData:@[@([self random:100]),@([self random:100]),@([self random:100]),@([self random:100])]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		NSColor* c = [[NSColor lightGrayColor] colorWithAlphaComponent:0.5f];
		ds.fillColor = c;
		ds.strokeColor = [NSColor grayColor];
		[datasets addObject:ds];
	}
	id win = [self.webview windowScriptObject];
	
	CWLineChartData* lcd = [[CWLineChartData alloc] initWithLabels:labels andDataSet:datasets];
	self.lineChart = [[CWLineChart alloc] initWithWindowScriptObject:win name:@"LineChart1" width:600 height:250 data:lcd options:nil];
	[self.lineChart addChart];
}

- (IBAction)removeLine:(id)sender {
	id win = [self.webview windowScriptObject];
	NSArray* params = @[@"LineChart1"];
	
	id res = [win callWebScriptMethod:@"deleteChart" withArguments:params];
	NSLog(@"Result: %@",res);
}

- (IBAction)changeLine:(id)sender {
	[self.lineChart setValue:@([self random:100]) inDataset:0 at:0];
	[self.lineChart setValue:@([self random:100]) inDataset:0 at:1];
	[self.lineChart setValue:@([self random:100]) inDataset:0 at:2];
	[self.lineChart setValue:@([self random:100]) inDataset:0 at:3];
	[self.lineChart update];
}

- (IBAction)addBar:(id)sender {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 4; i++) {
		CWBarDataSet* ds = [[CWBarDataSet alloc] initWithData:@[@([self random:100]),@([self random:100]),@([self random:100]),@([self random:100])]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		NSColor* c = [[NSColor lightGrayColor] colorWithAlphaComponent:0.5f];
		ds.fillColor = c;
		ds.strokeColor = [NSColor grayColor];
		[datasets addObject:ds];
	}
	id win = [self.webview windowScriptObject];
	
	CWBarChartData* bcd = [[CWBarChartData alloc] initWithLabels:labels andDataSet:datasets];
	CWBarChart* bc = [[CWBarChart alloc] initWithWindowScriptObject:win name:@"BarChart1" width:600 height:250 data:bcd options:nil];
	[bc addChart];
}

- (IBAction)addPolarArea:(id)sender {
	NSMutableArray* data = [NSMutableArray array];
	for(NSInteger i = 1; i < 11; i++) {
		CWSegmentData* segment = [[CWSegmentData alloc] init];
		segment.value = @([self random:100]+50);
		NSColor* c = [[NSColor lightGrayColor] colorWithAlphaComponent:0.5f];
		segment.color = c;
		segment.highlight = [NSColor lightGrayColor];
		segment.label = [NSString stringWithFormat:@"Label %ld",i];
		[data addObject:segment];
	}
	id win = [self.webview windowScriptObject];
	CWPolarAreaChart* pac = [[CWPolarAreaChart alloc] initWithWindowScriptObject:win name:@"PAC1" width:300 height:300 data:data options:nil];
	[pac addChart];
}

- (IBAction)makeJSON:(id)sender {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 11; i++) {
		CWPointDataSet* ds = [[CWPointDataSet alloc] initWithData:@[@([self random:100]),@([self random:100]),@([self random:100]),@([self random:100])]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		NSColor* c = [[NSColor lightGrayColor] colorWithAlphaComponent:0.5f];
		ds.fillColor = c;
		ds.strokeColor = [NSColor grayColor];
		[datasets addObject:ds];
	}
	CWLineChartData* ls = [[CWLineChartData alloc] initWithLabels:labels andDataSet:datasets];
	NSString* json = [ls JSON];
	NSLog(@"JSON:%@",json);
}

- (IBAction)addRadar:(id)sender {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 4; i++) {
		CWPointDataSet* ds = [[CWPointDataSet alloc] initWithData:@[@([self random:100]),@([self random:100]),@([self random:100]),@([self random:100])]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		NSColor* c = [[NSColor lightGrayColor] colorWithAlphaComponent:0.5f];
		ds.fillColor = c;
		ds.strokeColor = [NSColor grayColor];
		[datasets addObject:ds];
	}
	id win = [self.webview windowScriptObject];
	
	CWRadarChartData* rcd = [[CWRadarChartData alloc] initWithLabels:labels andDataSet:datasets];
	CWRadarChart* rc = [[CWRadarChart alloc] initWithWindowScriptObject:win name:@"RadarChart1" width:600 height:250 data:rcd options:nil];
	[rc addChart];
}

@end
