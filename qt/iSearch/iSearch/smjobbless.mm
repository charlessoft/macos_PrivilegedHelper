// -----------------------------------------------------------------------------------
// ! @author mbsanchez
// ! @date 22/04/2016
//
// Copyright 2016 mbsanchez. All rights reserved.
//
// This file is part of PrivilegedHelperExample.
//
// PrivilegedHelperExample is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2
// as published by the Free Software Foundation.
//
// PrivilegedHelperExample is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program (see the file LICENSE included with this
// distribution); if not, write to the Free Software Foundation, Inc.,
// 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// or see http://www.gnu.org/licenses/.
// -----------------------------------------------------------------------------------

#include <QtGui>
//#include "../common/SSPrivilegedHelperCommon.h"
#include <ServiceManagement/ServiceManagement.h>
#include <Security/Security.h>
#include <Security/Authorization.h>
#include <Security/Security.h>
#include <Security/SecCertificate.h>
#include <Security/SecCode.h>
#include <Security/SecStaticCode.h>
#include <Security/SecCodeHost.h>
#include <Security/SecRequirement.h>
#include <syslog.h>
#include <CoreFoundation/CFDictionary.h>
#include <CoreFoundation/CFError.h>
#include "smjobbless.h"
#include <time.h>
#include <netinet/in.h>
#include <sys/mount.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/un.h>



@implementation MacSMJob

// 安装助手工具
- (void)initHelperTool{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    if (YES == [userDefaults boolForKey:@"installTool"]) {
        NSError *error = nil;
        OSStatus status = AuthorizationCreate(NULL, kAuthorizationEmptyEnvironment, kAuthorizationFlagDefaults, &self->_authRef);
        if (status != errAuthorizationSuccess) {
            /* AuthorizationCreate really shouldn't fail. */
            assert(NO);
            self->_authRef = NULL;
        }

        if (![self blessHelperWithLabel:@"com.cool.iSearch.Helper" error:&error]) {
            NSLog(@"Something went wrong! %@ / %d", [error domain], (int) [error code]);
        } else {
            /* At this point, the job is available. However, this is a very
             * simple sample, and there is no IPC infrastructure set up to
             * make it launch-on-demand. You would normally achieve this by
             * using XPC (via a MachServices dictionary in your launchd.plist).
             */
            NSLog(@"Job is available!");
            [userDefaults setBool:YES forKey:@"installTool"];
            [userDefaults synchronize];
        }
//    }
}

- (BOOL)blessHelperWithLabel:(NSString *)label error:(NSError **)errorPtr;
{
    BOOL result = NO;
    NSError * error = nil;

    AuthorizationItem authItem        = { kSMRightBlessPrivilegedHelper, 0, NULL, 0 };
    AuthorizationRights authRights    = { 1, &authItem };
    AuthorizationFlags flags        =    kAuthorizationFlagDefaults                |
                                        kAuthorizationFlagInteractionAllowed    |
                                        kAuthorizationFlagPreAuthorize            |
                                        kAuthorizationFlagExtendRights;

    /* Obtain the right to install our privileged helper tool (kSMRightBlessPrivilegedHelper). */
    OSStatus status = AuthorizationCopyRights(self->_authRef, &authRights, kAuthorizationEmptyEnvironment, flags, NULL);
    if (status != errAuthorizationSuccess) {
        error = [NSError errorWithDomain:NSOSStatusErrorDomain code:status userInfo:nil];
    } else {
        CFErrorRef  cfError;

        /* This does all the work of verifying the helper tool against the application
         * and vice-versa. Once verification has passed, the embedded launchd.plist
         * is extracted and placed in /Library/LaunchDaemons and then loaded. The
         * executable is placed in /Library/PrivilegedHelperTools.
         */
        result = (BOOL) SMJobBless(kSMDomainSystemLaunchd, (__bridge CFStringRef)label, self->_authRef, &cfError);
        if (!result) {
            error = CFBridgingRelease(cfError);
        }
    }
    if ( ! result && (errorPtr != NULL) ) {
        assert(error != nil);
        *errorPtr = error;
    }

    return result;
}


@end

