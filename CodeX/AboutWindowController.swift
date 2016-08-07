//
//  AboutWindowController.swift
//  CodeX
//
//  Created by Maurious Paul on 07/08/16.
//  Copyright © 2016 Themelios. All rights reserved.
//

import Cocoa

class AboutWindowController: NSWindowController {

    @IBOutlet var aboutWindow: NSWindow!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        self.aboutWindow.backgroundColor = NSColor(red: 38/255, green: 120/255, blue: 113/255, alpha: 1.0)
        
        self.aboutWindow.alphaValue = 0.95
        
        self.aboutWindow.titlebarAppearsTransparent = true
    }

}
