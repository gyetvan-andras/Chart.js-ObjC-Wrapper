//
//  ViewController.m
//  ChartJSWrapper-IOS
//
//  Created by András Gyetván on 24/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import "ViewController.h"
#import "CW.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *wview;
@property (strong, nonatomic) WKWebView *webview;
@property (strong) CWLineChart* lineChart;
@property (strong) CWBarChart* barChart;
@property (strong) CWPieChart* pieChart;
@property (strong) PulldownMenu* pulldownMenu;

- (IBAction)openMenu:(id)sender;

- (void) createMenu;
@end

@implementation ViewController

- (NSInteger) random:(NSInteger) max {
	return (NSInteger)arc4random_uniform((u_int32_t)max);
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self createMenu];
	
	WKWebView* webview = [[WKWebView alloc] initWithFrame:self.wview.bounds];
	[webview setTranslatesAutoresizingMaskIntoConstraints:NO];
	[self.wview addSubview:webview];
	
	NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(webview);
	[self.wview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[webview]|" options:0 metrics:nil views:viewsDictionary]];
	[self.wview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[webview]|" options:0 metrics:nil views:viewsDictionary]];
	
	
	self.webview = webview;
	NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
	NSString *htmlPath = [resourcesPath stringByAppendingString:@"/cw.html"];
	[self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]]];
}


-(void)pullDownAnimated:(BOOL)open
{
	if (open)
	{
		NSLog(@"Pull down menu open!");
	}
	else
	{
		NSLog(@"Pull down menu closed!");
	}
}

- (void) createMenu {
	self.pulldownMenu = [[PulldownMenu alloc] initWithView:self.view];
	self.pulldownMenu.cellHeight = 25;
	self.pulldownMenu.cellFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f];
	[self.view addSubview:self.pulldownMenu];
	
	[self.pulldownMenu insertButton:@"Line"];
	[self.pulldownMenu insertButton:@"Radar"];
	[self.pulldownMenu insertButton:@"Bar"];
	[self.pulldownMenu insertButton:@"Polar Area"];
	[self.pulldownMenu insertButton:@"Pie"];
	[self.pulldownMenu insertButton:@"Doughnut"];
	[self.pulldownMenu insertButton:@"Remove from/ Add to Pie"];
	[self.pulldownMenu insertButton:@"Change Pie"];
	[self.pulldownMenu insertButton:@"Change Bar"];
	[self.pulldownMenu insertButton:@"Change Line"];
	[self.pulldownMenu insertButton:@"Remove from/ Add to Line"];
	
	self.pulldownMenu.delegate = self;
	
	[self.pulldownMenu loadMenu];

}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)openMenu:(id)sender {
	[self.pulldownMenu animateDropDown];
}

-(void)menuItemSelected:(NSIndexPath *)indexPath
{
	[self.pulldownMenu animateDropDown];
	switch(indexPath.item) {
		case 0:
			[self addLine];
			break;
		case 1:
			[self addRadar];
			break;
		case 2:
			[self addBar];
			break;
		case 3:
			[self addPolarArea];
			break;
		case 4:
			[self addPie];
			break;
		case 5:
			[self addDoughnut];
			break;
		case 6:
			[self delAddPie];
			break;
		case 7:
			[self changePie];
			break;
		case 8:
			[self changeBar];
			break;
		case 9:
			[self changeLine];
			break;
		case 10:
			[self delAddLine];
			break;
	}
}

#pragma mark -
#pragma mark Chart Calls

- (void)addLine {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 4; i++) {
		CWPointDataSet* ds = [[CWPointDataSet alloc] initWithData:@[@([self random:100]),@([self random:100]),@([self random:100]),@([self random:100])]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		CWColor* c1 = [[CWColors sharedColors] pickColor];
		CWColor* c2 = [c1 colorWithAlphaComponent:0.5f];
		ds.fillColor = c2;
		ds.strokeColor = c1;
		[datasets addObject:ds];
	}
	
	CWLineChartData* lcd = [[CWLineChartData alloc] initWithLabels:labels andDataSet:datasets];
	self.lineChart = [[CWLineChart alloc] initWithWebView:self.webview name:@"LineChart1" width:300 height:200 data:lcd options:nil];
	[self.lineChart addChart];
}

- (void)delAddLine {
	[self.lineChart removeData];
	[self.lineChart addData:@[@([self random:100]),@([self random:100]),@([self random:100]),@([self random:100])] label:@"W"];
}

- (void)changeLine {
	for(NSInteger i = 1; i < 4; i++) {
		[self.lineChart setValue:@([self random:100]) inDataset:i-1 at:0];
		[self.lineChart setValue:@([self random:100]) inDataset:i-1 at:1];
		[self.lineChart setValue:@([self random:100]) inDataset:i-1 at:2];
		[self.lineChart setValue:@([self random:100]) inDataset:i-1 at:3];
	}
	[self.lineChart update];
}

- (void)addBar {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 4; i++) {
		CWBarDataSet* ds = [[CWBarDataSet alloc] initWithData:@[@([self random:100]+50),@([self random:100]+50),@([self random:100]+50),@([self random:100]+50)]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		CWColor* c1 = [[CWColors sharedColors] pickColor];
		CWColor* c2 = [c1 colorWithAlphaComponent:0.8f];
		ds.fillColor = c2;
		ds.strokeColor = c1;
		[datasets addObject:ds];
	}
	//	id win = [self.webview windowScriptObject];
	
	CWBarChartData* bcd = [[CWBarChartData alloc] initWithLabels:labels andDataSet:datasets];
	CWBarChart* bc = [[CWBarChart alloc] initWithWebView:self.webview name:@"BarChart1" width:300 height:200 data:bcd options:nil];
	[bc addChart];
	self.barChart = bc;
}

- (void)addPolarArea {
	NSMutableArray* data = [NSMutableArray array];
	for(NSInteger i = 1; i < 11; i++) {
		CWSegmentData* segment = [[CWSegmentData alloc] init];
		segment.value = @([self random:100]+50);
		CWColor* c1 = [[CWColors sharedColors] pickColor];
		CWColor* c2 = [c1 colorWithAlphaComponent:0.8f];
		segment.color = c2;
		segment.highlight = c1;
		segment.label = [NSString stringWithFormat:@"Label %ld",i];
		[data addObject:segment];
	}
	//	id win = [self.webview windowScriptObject];
	CWPolarAreaChart* pac = [[CWPolarAreaChart alloc] initWithWebView:self.webview name:@"PAC1" width:300 height:300 data:data options:nil];
	[pac addChart];
}

- (void)addPie {
	NSMutableArray* data = [NSMutableArray array];
	for(NSInteger i = 1; i < 11; i++) {
		CWSegmentData* segment = [[CWSegmentData alloc] init];
		segment.value = @([self random:100]+50);
		CWColor* c1 = [[CWColors sharedColors] pickColor];
		CWColor* c2 = [c1 colorWithAlphaComponent:0.8f];
		segment.color = c2;
		segment.highlight = c1;
		segment.label = [NSString stringWithFormat:@"Label %ld",i];
		[data addObject:segment];
	}
	//	id win = [self.webview windowScriptObject];
	CWPieChart* pc = [[CWPieChart alloc] initWithWebView:self.webview name:@"PIE1" width:300 height:300 data:data options:nil];
	[pc addChart];
	self.pieChart = pc;
}

- (void)addDoughnut {
	NSMutableArray* data = [NSMutableArray array];
	for(NSInteger i = 1; i < 11; i++) {
		CWSegmentData* segment = [[CWSegmentData alloc] init];
		segment.value = @([self random:100]+50);
		CWColor* c1 = [[CWColors sharedColors] pickColor];
		CWColor* c2 = [c1 colorWithAlphaComponent:0.8f];
		segment.color = c2;
		segment.highlight = c1;
		segment.label = [NSString stringWithFormat:@"Label %ld",i];
		[data addObject:segment];
	}
	//	id win = [self.webview windowScriptObject];
	CWDoughnutChart* pc = [[CWDoughnutChart alloc] initWithWebView:self.webview name:@"Doughnut1" width:300 height:300 data:data options:nil];
	[pc addChart];
}

- (void)changePie {
	for(NSInteger i = 1; i < 11; i++) {
		[self.pieChart setValue:@([self random:100]+50) inSegment:i-1];
	}
	[self.pieChart update];
}

- (void)changeBar {
	for(NSInteger i = 1; i < 4; i++) {
		[self.barChart setValue:@([self random:100]+50) inDataset:i-1 at:0];
		[self.barChart setValue:@([self random:100]+50) inDataset:i-1 at:1];
		[self.barChart setValue:@([self random:100]+50) inDataset:i-1 at:2];
		[self.barChart setValue:@([self random:100]+50) inDataset:i-1 at:3];
	}
	[self.barChart update];
}

- (void)delAddPie {
	[self.pieChart removeDataAt:@(1)];
	CWSegmentData* segment = [[CWSegmentData alloc] init];
	segment.value = @([self random:100]+50);
	CWColor* c = [[CWColor lightGrayColor] colorWithAlphaComponent:0.8f];
	segment.color = c;
	segment.highlight = [CWColor grayColor];
	segment.label = @"NEW SEGMENT";
	[self.pieChart addData:segment index:@(3)];
}

- (void)addRadar {
	NSArray* labels = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D"]];
	NSMutableArray* datasets = [NSMutableArray array];
	for(NSInteger i = 1; i < 4; i++) {
		CWPointDataSet* ds = [[CWPointDataSet alloc] initWithData:@[@([self random:100]+50),@([self random:100]+50),@([self random:100]+50),@([self random:100]+50)]];
		ds.label = [NSString stringWithFormat:@"Label %ld",i];
		CWColor* c1 = [[CWColors sharedColors] pickColor];
		CWColor* c2 = [c1 colorWithAlphaComponent:0.5f];
		ds.fillColor = c2;
		ds.strokeColor = c1;
		[datasets addObject:ds];
	}
	
	CWRadarChartData* rcd = [[CWRadarChartData alloc] initWithLabels:labels andDataSet:datasets];
	CWRadarChart* rc = [[CWRadarChart alloc] initWithWebView:self.webview name:@"RadarChart1" width:300 height:300 data:rcd options:nil];
	[rc addChart];
}


@end
