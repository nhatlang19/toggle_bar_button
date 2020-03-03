#import "ToggleBarButtonPlugin.h"
#if __has_include(<toggle_bar_button/toggle_bar_button-Swift.h>)
#import <toggle_bar_button/toggle_bar_button-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "toggle_bar_button-Swift.h"
#endif

@implementation ToggleBarButtonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftToggleBarButtonPlugin registerWithRegistrar:registrar];
}
@end
