#include "EXORootListController.h"

#define kTintColor [UIColor colorWithRed:0.0/255.0 green:77.0/255.0 blue:159.0/255.0 alpha:1.0]
#define kIdentifier @"com.zachatrocity.exsto"
#define kSettingsPath @"/var/mobile/Library/Preferences/com.zachatrocity.exsto.plist"
#define kSettingsChangedNotification (CFStringRef)@"com.zachatrocity.exsto/prefsChanged"
#define prefsAppID CFSTR("com.zachatrocity.exsto")

@implementation EXSTOHeader
- (id)initWithSpecifier:(PSSpecifier *)specifier {
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  if (self) {
		#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
		CGRect labelFrame = CGRectMake(0, -15, kWidth, 80);
		CGRect underLabelFrame = CGRectMake(0, 35, kWidth, 60);

		label = [[UILabel alloc] initWithFrame:labelFrame];
		[label setNumberOfLines:1];
		label.font = [UIFont boldSystemFontOfSize:65];
		[label setText:@"Exsto XS"];
		label.textColor = kTintColor;
		label.textAlignment = NSTextAlignmentCenter;

		underLabel = [[UILabel alloc] initWithFrame:underLabelFrame];
		[underLabel setNumberOfLines:1];
		underLabel.font = [UIFont systemFontOfSize:20];
		[underLabel setText:@"Unleash your folders."];
		underLabel.textColor = [UIColor grayColor];
		underLabel.textAlignment = NSTextAlignmentCenter;

		[self addSubview:label];
		[self addSubview:underLabel];
  }
  return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
  CGFloat prefHeight = 75.0;
  return prefHeight;
}
@end

@implementation EXORootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (instancetype)init {
   self = [super init];

   if (self) {
       HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
       appearanceSettings.tintColor = kTintColor;
       appearanceSettings.tableViewCellSeparatorColor = [UIColor whiteColor];
       appearanceSettings.tableViewCellTextColor = kTintColor;
       appearanceSettings.tableViewCellSelectionColor = kTintColor;
       self.hb_appearanceSettings = appearanceSettings;

       UIBarButtonItem *respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring)];
       self.navigationItem.rightBarButtonItem = respringButton;
   }

   return self;
}

- (void)resetPrefs:(id)sender {
  HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.zachatrocity.exsto"];
  [prefs removeAllObjects];

  [self respring:sender];
}

- (void)respring:(id)sender {
  NSTask *t = [[[NSTask alloc] init] autorelease];
  [t setLaunchPath:@"/usr/bin/killall"];
  [t setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
  [t launch];
}
@end
