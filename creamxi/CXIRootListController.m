#include "CXIRootListController.h"

@implementation CXIRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}
-(void)respring {
    system("killall -9 SpringBoard");
}
-(void)twitterMethod
{
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/RustyBalboaDev"]];
}
-(void)paypalMethod
{
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/rustybalboadev"]];
}
@end
