//
//  ShareKitDemoConfigurator.m
//  ShareKit
//
//  Created by Vilem Kurz on 12.11.2011.
//  Copyright (c) 2011 Cocoa Miners. All rights reserved.
//

#import "ShareKitDemoConfigurator.h"
#import "Model.h"
#import "AppSettings.h"
#import "Localization.h"

@implementation ShareKitDemoConfigurator

/* 
 App Description 
 ---------------
 These values are used by any service that shows 'shared from XYZ'
 */
- (NSString*)appName {
    return [[Localization instance] stringWithKey:@"txt_appName"];
}

- (NSString*)appURL {
	return iTunesLink;
}

/*
 API Keys
 --------
 This is the longest step to getting set up, it involves filling in API keys for the supported services.
 It should be pretty painless though and should hopefully take no more than a few minutes.
 
 Each key below as a link to a page where you can generate an api key.  Fill in the key for each service below.
 
 A note on services you don't need:
 If, for example, your app only shares URLs then you probably won't need image services like Flickr.
 In these cases it is safe to leave an API key blank.
 
 However, it is STRONGLY recommended that you do your best to support all services for the types of sharing you support.
 The core principle behind ShareKit is to leave the service choices up to the user.  Thus, you should not remove any services,
 leaving that decision up to the user.
 */


// Vkontakte
// SHKVkontakteAppID is the Application ID provided by Vkontakte
- (NSString*)vkontakteAppId { 
    return @"4033260";
}

// Facebook - https://developers.facebook.com/apps
// SHKFacebookAppID is the Application ID provided by Facebook
// SHKFacebookLocalAppID is used if you need to differentiate between several iOS apps running against a single Facebook app. Useful, if you have full and lite versions of the same app,
// and wish sharing from both will appear on facebook as sharing from one main app. You have to add different suffix to each version. Do not forget to fill both suffixes on facebook developer ("URL Scheme Suffix"). Leave it blank unless you are sure of what you are doing. 
// The CFBundleURLSchemes in your App-Info.plist should be "fb" + the concatenation of these two IDs.
// Example: 
//    SHKFacebookAppID = 555
//    SHKFacebookLocalAppID = lite
// 
//    Your CFBundleURLSchemes entry: fb555lite
- (NSString*)facebookAppId {
    return @"414863125292055";
}

- (NSString*)facebookLocalAppId {
	return @"";
}

- (NSArray*)facebookListOfPermissions {    
    return [NSArray arrayWithObjects:@"publish_stream", @"offline_access",@"user_likes",@"read_stream", nil];
}

// Read It Later - http://readitlaterlist.com/api/signup/ 
- (NSString*)readItLaterKey {
	return @"45aT6Vfvg66eWNebybd680gu13pdba3d";
}
// Twitter - http://dev.twitter.com/apps/new
/*
 Important Twitter settings to get right:
 
 Differences between OAuth and xAuth
 --
 There are two types of authentication provided for Twitter, OAuth and xAuth.  OAuth is the default and will
 present a web view to log the user in.  xAuth presents a native entry form but requires Twitter to add xAuth to your app (you have to request it from them).
 If your app has been approved for xAuth, set SHKTwitterUseXAuth to 1.
 
 Callback URL (important to get right for OAuth users)
 --
 1. Open your application settings at http://dev.twitter.com/apps/
 2. 'Application Type' should be set to BROWSER (not client)
 3. 'Callback URL' should match whatever you enter in SHKTwitterCallbackUrl.  The callback url doesn't have to be an actual existing url.  The user will never get to it because ShareKit intercepts it before the user is redirected.  It just needs to match.
 */

- (NSString*)twitterConsumerKey {
	return @"v1Z86nFTSZJFLC7qfEMJw";
}

- (NSString*)twitterSecret {
	return @"3cDt6otifHDixN5J5lxSx1Oa7IoPpVi0m5PRe2kl1gE";
}
// You need to set this if using OAuth, see note above (xAuth users can skip it)
- (NSString*)twitterCallbackUrl {
	return @"http://example.com/oauth";
}
// To use xAuth, set to 1
- (NSNumber*)twitterUseXAuth {
	return [NSNumber numberWithInt:0];
}
// Enter your app's twitter account if you'd like to ask the user to follow it when logging in. (Only for xAuth)
- (NSString*)twitterUsername {
	return @"";
}
// Evernote - http://www.evernote.com/about/developer/api/
/*	You need to set to sandbox until you get approved by evernote
 // Sandbox
 #define SHKEvernoteUserStoreURL    @"https://sandbox.evernote.com/edam/user"
 #define SHKEvernoteNetStoreURLBase @"http://sandbox.evernote.com/edam/note/"
 
 // Or production
 #define SHKEvernoteUserStoreURL    @"https://www.evernote.com/edam/user"
 #define SHKEvernoteNetStoreURLBase @"http://www.evernote.com/edam/note/"
 */

- (NSString*)evernoteUserStoreURL {
	return @"https://sandbox.evernote.com/edam/user";
}

- (NSString*)evernoteNetStoreURLBase {
	return @"http://sandbox.evernote.com/edam/note/";
}

- (NSString*)evernoteConsumerKey {
	return @"vilemkurz";
}

- (NSString*)evernoteSecret {
	return @"e58755227940c41f";
}
// Flickr - http://www.flickr.com/services/apps/create/
/*
 1 - This requires the CFNetwork.framework 
 2 - One needs to setup the flickr app as a "web service" on the flickr authentication flow settings, and enter in your app's custom callback URL scheme. 
 3 - make sure you define and create the same URL scheme in your apps info.plist. It can be as simple as yourapp://flickr */
- (NSString*)flickrConsumerKey {
    return @"72f05286417fae8da2d7e779f0eb1b2a";
}

- (NSString*)flickrSecretKey {
    return @"b5e731f395031782";
}
// The user defined callback url
- (NSString*)flickrCallbackUrl{
    return @"app://flickr";
}

// Bit.ly for shortening URLs in case you use original SHKTwitter sharer (pre iOS5). If you use iOS 5 builtin framework, the URL will be shortened anyway, these settings are not used in this case. http://bit.ly/account/register - after signup: http://bit.ly/a/your_api_key If you do not enter credentials, URL will be shared unshortened.
- (NSString*)bitLyLogin {
	return @"yasnickivladislav";
}

- (NSString*)bitLyKey {
	return @"R_4de539443cfcf8b5c7b9f6fa09e0e9ef";
}

// LinkedIn - https://www.linkedin.com/secure/developer
- (NSString*)linkedInConsumerKey {
	return @"9f8m5vx0yhjf";
}

- (NSString*)linkedInSecret {
	return @"";
}

- (NSString*)linkedInCallbackUrl {
	return @"http://yourdomain.com/callback";
}

// Foursquare V2 - https://developer.foursquare.com
- (NSString*)foursquareV2ClientId {
    return @"NFJOGLJBI4C4RSZ3DQGR0W4ED5ZWAAE5QO3FW02Z3LLVZCT4";
}

- (NSString*)foursquareV2RedirectURI {
    return @"app://foursquare";
}


/*
 UI Configuration : Basic
 ------------------------
 These provide controls for basic UI settings.  For more advanced configuration see below.
 */

- (UIColor*)barTintForView:(UIViewController*)vc {    
	
    if ([NSStringFromClass([vc class]) isEqualToString:@"SHKTwitter"]) 
        return [UIColor colorWithRed:0 green:151.0f/255 blue:222.0f/255 alpha:1];
    
    if ([NSStringFromClass([vc class]) isEqualToString:@"SHKFacebook"]) 
        return [UIColor colorWithRed:59.0f/255 green:89.0f/255 blue:152.0f/255 alpha:1];
    
    return nil;
}

@end
