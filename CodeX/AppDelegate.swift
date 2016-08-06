//
//  AppDelegate.swift
//  CodeX
//
//  Created by Maurious Paul on 04/08/16.
//  Copyright © 2016 Themelios. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var createOneBtn: NSButton!

    @IBOutlet weak var openAnotherBtn: NSButton!

    var createNewWindow: CreateNewWindowController!
    
    let btnTextStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        btnTextStyle.alignment = NSTextAlignment.Center
        
        let createOneTxt = NSAttributedString(string: "CREATE ONE", attributes: [ NSForegroundColorAttributeName : NSColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let openAnotherTxt = NSAttributedString(string: "OPEN ANOTHER", attributes: [ NSForegroundColorAttributeName : NSColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        self.window.backgroundColor = NSColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1.0)
        
        self.window.alphaValue = 0.95
        
        self.window.titlebarAppearsTransparent = true
        
        self.createOneBtn.attributedTitle = createOneTxt
        
        self.openAnotherBtn.attributedTitle = openAnotherTxt
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        
        NSApp.terminate(self)
    }

    @IBAction func showCreateOneWindow(sender: NSButton) {
        
        self.window.orderOut(self)
        
        createNewWindow = CreateNewWindowController(windowNibName: "CreateNewWindowController")
        
        createNewWindow.showWindow(self)
    }

    @IBAction func showOpenAnotherWindow(sender: NSButton) {
    }
}

