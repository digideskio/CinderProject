
#include "cinder/app/CinderView.h"
#include "CinderProjectApp.h"
#import <Cocoa/Cocoa.h>

@interface CinderProjectDelegate : NSObject <NSApplicationDelegate>
{
	CinderProjectApp *mApp;
}

@property (nonatomic, weak) IBOutlet NSWindow		*window;
@property (nonatomic, weak) IBOutlet CinderView		*cinderView;
@property (nonatomic, weak) IBOutlet NSColorWell	*colorWell;

@property (assign) IBOutlet NSLayoutConstraint *settingsHeightConstraint;

- (IBAction)subdivisionSliderChanged:(id)sender;
- (IBAction)colorChanged:(id)sender;
- (IBAction)showSettings:(id)sender;

@end
