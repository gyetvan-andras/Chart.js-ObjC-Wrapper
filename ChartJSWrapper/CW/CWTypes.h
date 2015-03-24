//
//  CWTypes.h
//  ChartJSWrapper
//
//  Created by András Gyetván on 24/03/15.
//  Copyright (c) 2015 Gyetván András. All rights reserved.
//

#import <TargetConditionals.h>
#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>
#define CWColor UIColor
#define CWWebView WKWebView
#else

#import <Cocoa/Cocoa.h>
#define CWColor NSColor
#define CWWebView WebView

#endif