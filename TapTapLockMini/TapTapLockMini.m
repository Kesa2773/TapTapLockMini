//
//  TapTapLockMini.m
//  TapTapLockMini
//
//  Created by Artem Kasper on 12.02.2023.
//  Copyright © 2023 Artem Kasper. All rights reserved.
//

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

@import UIKit;
#import <Foundation/Foundation.h>
#import "CaptainHook/CaptainHook.h"

@interface SBHomeScreenViewController : UIViewController
@end


@interface SpringBoard : UIApplication
- (void)_simulateLockButtonPress;
@end

CHDeclareClass(SBHomeScreenViewController);
CHDeclareMethod(0, void, SBHomeScreenViewController, viewDidLoad)
{
    CHSuper(0, SBHomeScreenViewController, viewDidLoad);
    UITapGestureRecognizer *JOKER = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hs_didDoubleTapHS)];
    JOKER.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:JOKER];
}

CHDeclareMethod(0, void, SBHomeScreenViewController, hs_didDoubleTapHS)
{
    SpringBoard *BATMAN = (SpringBoard *)[NSClassFromString(@"SpringBoard") sharedApplication];
        [BATMAN _simulateLockButtonPress];
}
