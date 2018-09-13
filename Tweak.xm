#import <UIKit/UIKit.h>
#import "libcolorpicker.h"
@interface CCUIRoundButton : UIView
-(id)_viewControllerForAncestor;
@end

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.rustybalboa.creamxi.plist"
#define PLIST_PATH_COLORS @"/var/mobile/Library/Preferences/com.rustybalboa.creamxicolors.plist"
#define prefsDict [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH]
#define prefsColorsDict [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH_COLORS]

static NSString *BluetoothColor = @"BluetoothColor";
static NSString *AirplaneColor = @"AirplaneColor";
static NSString *CellularColor = @"CellularColor";
static NSString *WifiColor = @"WifiColor";
static NSString *AirdropColor = @"AirdropColor";
static NSString *HotspotColor = @"HotspotColor";




%hook CCUIRoundButton
-(void)layoutSubviews
{
    %orig;
    //Cycle through button subviews and set the color of the button
    for (UIView* subview in self.subviews)
    {
        if (![subview isMemberOfClass:[UIImageView class]] && ![subview isMemberOfClass:[objc_getClass("MTMaterialView") class]] && ![subview isMemberOfClass:[objc_getClass("CCUICAPackageView") class]])
        {
                //this is the code for the bluetooth button (replace CCUIConnectivityBluetoothViewController with CCUIConnectivityAirplaneViewController for airplane mode etc.)
            if ([[self _viewControllerForAncestor] isMemberOfClass:[objc_getClass("CCUIConnectivityBluetoothViewController") class]])
            {
                [subview setBackgroundColor:LCPParseColorString([prefsColorsDict objectForKey:BluetoothColor], @"#FF0000")];
            }
            else if ([[self _viewControllerForAncestor] isMemberOfClass:[objc_getClass("CCUIConnectivityAirplaneViewController") class]])
            {
                [subview setBackgroundColor:LCPParseColorString([prefsColorsDict objectForKey:AirplaneColor], @"#FF0000")];
            }
            else if ([[self _viewControllerForAncestor] isMemberOfClass:[objc_getClass("CCUIConnectivityCellularDataViewController") class]])
            {
                [subview setBackgroundColor:LCPParseColorString([prefsColorsDict objectForKey:CellularColor], @"#FF0000")];
            }
            else if ([[self _viewControllerForAncestor] isMemberOfClass:[objc_getClass("CCUIConnectivityWifiViewController") class]])
            {
                [subview setBackgroundColor:LCPParseColorString([prefsColorsDict objectForKey:WifiColor], @"#FF0000")];
            }
            else if ([[self _viewControllerForAncestor] isMemberOfClass:[objc_getClass("CCUIConnectivityAirDropViewController") class]])
            {
                [subview setBackgroundColor:LCPParseColorString([prefsColorsDict objectForKey:AirdropColor], @"#FF0000")];
            }
            else if ([[self _viewControllerForAncestor] isMemberOfClass: [objc_getClass("CCUIConnectivityHotspotViewController") class]])
            {
                [subview setBackgroundColor:LCPParseColorString([prefsColorsDict objectForKey:HotspotColor], @"#FF0000")];
            }
            break;
        }
    }
}
%end
