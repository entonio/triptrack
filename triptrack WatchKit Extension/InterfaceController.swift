/*
 Copyright (c) 2016, Antonio Marques
 All rights reserved.

 You may use and redistribute this software, with or without modification, under the following conditions:

 1. Redistributions must retain the above copyright notice, this list of conditions and the following disclaimer.
 2. If this source code is modified other than simply to allow integration with other software, no restrictions may be added to redistribution.

 THE COPYRIGHT HOLDERS PROVIDE THIS SOFTWARE IN GOOD FAITH BUT TAKE NO RESPONSIBILITY FOR IT.
 */

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
