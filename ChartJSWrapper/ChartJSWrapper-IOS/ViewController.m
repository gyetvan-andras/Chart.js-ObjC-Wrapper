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

- (IBAction)addLine:(id)sender;
- (IBAction)changeLine:(id)sender;

@end

@implementation ViewController

- (NSInteger) random:(NSInteger) max {
	return (NSInteger)arc4random_uniform((u_int32_t)max);
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.webview = [[WKWebView alloc] initWithFrame:self.wview.bounds];
	[self.wview addSubview:self.webview];
	
	NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
	NSString *htmlPath = [resourcesPath stringByAppendingString:@"/cw.html"];
	[self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]]];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)addLine:(id)sender {
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
	self.lineChart = [[CWLineChart alloc] initWithWebView:self.webview name:@"LineChart1" width:600 height:250 data:lcd options:nil];
	[self.lineChart addChart];
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
@end
