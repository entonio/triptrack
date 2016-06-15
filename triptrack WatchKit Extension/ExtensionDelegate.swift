/*
 Copyright (c) 2016, Antonio Marques
 All rights reserved.

 You may use and redistribute this software, with or without modification, under the following conditions:

 1. Redistributions must retain the above copyright notice, this list of conditions and the following disclaimer.
 2. If this source code is modified other than simply to allow integration with other software, no restrictions may be added to redistribution.

 THE COPYRIGHT HOLDERS PROVIDE THIS SOFTWARE IN GOOD FAITH BUT TAKE NO RESPONSIBILITY FOR IT.
 */

import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

}
