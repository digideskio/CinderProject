#include "cinder/Cinder.h"
#include "cinder/Rand.h"
#include "cinder/app/RendererGl.h"
#import "CinderProjectDelegate.h"
#import <Cocoa/Cocoa.h>

@interface CinderProjectDelegate ()

@property (nonatomic) BOOL isShowingSettings;

@end

@implementation CinderProjectDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	mApp = new CinderProjectApp;
	mApp->prepareLaunch();
	mApp->setupCinderView( self.cinderView, cinder::app::RendererGl::create() );
	mApp->launch();

	[self.window setAcceptsMouseMovedEvents:YES];
	
	self.colorWell.color = [NSColor colorWithCalibratedRed:mApp->mColor.r
													 green:mApp->mColor.g
													  blue:mApp->mColor.b
													 alpha:1.0f];
	
	self.isShowingSettings = YES;
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
}

- (IBAction)subdivisionSliderChanged:(id)sender
{
	mApp->mRadius = [sender intValue];
}

- (IBAction)colorChanged:(id)sender
{
	NSColor *color = [sender color];
	mApp->mColor = ci::Colorf( [color redComponent], [color greenComponent], [color blueComponent] );
}

- (IBAction)showSettings:(id)sender {
	[NSAnimationContext beginGrouping];
	if (self.isShowingSettings) {
		self.isShowingSettings = NO;
		self.settingsHeightConstraint.animator.constant = 0;
	} else {
		self.isShowingSettings = YES;
		self.settingsHeightConstraint.animator.constant = 60;
	}
	[NSAnimationContext endGrouping];
}

@end
