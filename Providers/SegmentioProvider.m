//
//  SegmentioProvider.m
//

#import "SegmentioProvider.h"
#import "ARAnalyticsProviders.h"
#import "Analytics.h"

@implementation SegmentioProvider

#ifdef AR_SEGMENTIO_EXISTS
- (id)initWithIdentifier:(NSString *)identifier {

    // TODO: remove after testing
    SEGAnalyticsConfiguration *config = [SEGAnalyticsConfiguration configurationWithWriteKey:identifier];
    config.flushAt = 1;
    [SEGAnalytics setupWithConfiguration:config];

    // TODO: uncomment
    // [SEGAnalytics setupWithConfiguration:[SEGAnalyticsConfiguration configurationWithWriteKey:identifier]];

    // TODO: remove
    [SEGAnalytics debug:YES];


    return [super init];
}

- (void)identifyUserWithID:(NSString *)userID andEmailAddress:(NSString *)email {
    if (userID && email) {
        [[SEGAnalytics sharedAnalytics] identify:userID traits:@{ @"email": email }];
    }
    else if (userID) {
        [[SEGAnalytics sharedAnalytics] identify:userID];
    }
}

- (void)event:(NSString *)event withProperties:(NSDictionary *)properties {
    [[SEGAnalytics sharedAnalytics] track:event properties:properties];
}

- (void)didShowNewPageView:(NSString *)pageTitle {
    [[SEGAnalytics sharedAnalytics] screen:pageTitle];

}

#endif
@end
