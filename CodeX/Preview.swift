//
//  Preview.swift
//  CodeX
//
//  Created by Maurious Paul on 07/08/16.
//  Copyright © 2016 Themelios. All rights reserved.
//

import Cocoa
import Fabric
import Crashlytics

class Preview: NSView {
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        
        let context: CGContextRef = (NSGraphicsContext.currentContext()?.CGContext)!
        
        CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.5)
        
        CGContextFillRect(context, NSRectToCGRect(dirtyRect))
                
        self.layer?.borderColor = NSColor.whiteColor().CGColor
        
        self.layer?.borderWidth = 3
    }
}
