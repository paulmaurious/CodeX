//
//  OpenAnotherWindowController.swift
//  CodeX
//
//  Created by Maurious Paul on 06/08/16.
//  Copyright © 2016 Themelios. All rights reserved.
//

import Cocoa
import Fabric
import Crashlytics

class OpenAnotherWindowController: NSWindowController {
    
    //List of Windows
    @IBOutlet var openAnotherWindow: NSWindow!
    
    @IBOutlet var openChoiceWindow: NSWindow!
    
    @IBOutlet var fileDropWindow: NSWindow!
    
    @IBOutlet var cameraViewWindow: NSWindow!
    
    //List of Buttons
    @IBOutlet var dismissWindowControllerBtn: NSButton!
    
    @IBOutlet var scanQRCodeBtn: NSButton!
    
    @IBOutlet var goBackBtn: NSButton!
    
    @IBOutlet var cameraBtn: NSButton!
    
    @IBOutlet var pictureBtn: NSButton!
    
    @IBOutlet var dismissOpenChoiceWindowBtn: NSButton!
    
    @IBOutlet var dropFileOKBtn: NSButton!
    
    @IBOutlet var dropFileCancelBtn: NSButton!
    
    //List of Other Outlets
    @IBOutlet var qrCodeImageView: NSImageView!
    
    @IBOutlet var scannedQRCodeMessage: NSTextView!
    
    @IBOutlet var fileStatusImageView: NSImageView!
    
    @IBOutlet var fileDropView: FileDropView!

    //List of Variables used
    var isGoBackEnabled = false
    
    var btnTextStyle = NSMutableParagraphStyle()
    
    var detector: CIDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        btnTextStyle.alignment = NSTextAlignment.Center
        
        let OK: NSAttributedString = NSAttributedString(string: "OK", attributes: [ NSForegroundColorAttributeName : NSColor(red: 105/255, green: 155/255, blue: 76/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let Cancel: NSAttributedString = NSAttributedString(string: "CANCEL", attributes: [ NSForegroundColorAttributeName : NSColor(red: 159/255, green: 76/255, blue: 76/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        self.openChoiceWindow.backgroundColor = NSColor.whiteColor()
        
        self.openChoiceWindow.alphaValue = 0.95
        
        self.openAnotherWindow.backgroundColor = NSColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1.0)
        
        self.openAnotherWindow.alphaValue = 0.95
        
        self.openAnotherWindow.titlebarAppearsTransparent = true
        
        self.openAnotherWindow.beginSheet(self.openChoiceWindow) { (response: NSModalResponse) in
            
        }
        
        self.window?.sharingType = NSWindowSharingType.ReadWrite
        
        pictureBtn.attributedTitle = NSAttributedString(string: "PICTURE", attributes: [ NSForegroundColorAttributeName : NSColor(red: 239/255, green: 120/255, blue: 145/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        cameraBtn.attributedTitle = NSAttributedString(string: "CAMERA", attributes: [ NSForegroundColorAttributeName : NSColor(red: 23/255, green: 183/255, blue: 199/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        dismissOpenChoiceWindowBtn.attributedTitle = Cancel
        
        dismissWindowControllerBtn.attributedTitle = Cancel
        
        goBackBtn.attributedTitle = NSAttributedString(string: "GO BACK", attributes: [ NSForegroundColorAttributeName : NSColor(red: 186/255, green: 161/255, blue: 132/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        scanQRCodeBtn.attributedTitle = NSAttributedString(string: "SCAN QR CODE", attributes: [ NSForegroundColorAttributeName : NSColor(red: 30/255, green: 113/255, blue: 69/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        dropFileOKBtn.attributedTitle = OK
        
        dropFileCancelBtn.attributedTitle = Cancel
    }
    
    @IBAction func dismissWindowController(sender: NSButton) {
        
        self.openAnotherWindow.close()
        
        NSApplication.sharedApplication().windows.first?.makeKeyAndOrderFront(self)
        
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
    }
    
    @IBAction func dismissOpenChoiceWindow(sender: NSButton) {
        
        if isGoBackEnabled {
            
            self.openAnotherWindow.endSheet(self.openChoiceWindow)
            
            isGoBackEnabled = false
        }
        else {
            
            self.openAnotherWindow.endSheet(self.openChoiceWindow)
            
            self.openAnotherWindow.close()
            
            NSApplication.sharedApplication().windows.first?.makeKeyAndOrderFront(self)
            
            NSApplication.sharedApplication().activateIgnoringOtherApps(true)
            
            isGoBackEnabled = false
        }
    }
    
    @IBAction func scanFromPicture(sender: NSButton) {
        
        self.fileStatusImageView.image = NSImage(named: "DROP")
        
        self.openAnotherWindow.endSheet(self.openChoiceWindow)
        
        self.openAnotherWindow.beginSheet(self.fileDropWindow) { (response: NSModalResponse) in
            
        }
    }
    
    @IBAction func scanFromCamera(sender: NSButton) {
        
        self.openAnotherWindow.endSheet(openChoiceWindow)
        
        self.openAnotherWindow.beginSheet(cameraViewWindow) { (response: NSModalResponse) in
            
        }
    }
    
    @IBAction func closeFileDropWindow(sender: NSButton) {
                
        NSLog(self.fileDropView.fileTypeIsOk.description)
        
        if self.fileDropView.fileTypeIsOk {
            
            self.openAnotherWindow.endSheet(self.fileDropWindow)
            
            self.qrCodeImageView.image = NSImage(byReferencingFile: self.fileDropView.droppedFilePath!)
        }
    }
    
    @IBAction func dismissFileDropView(sender: NSButton) {
        
        self.openAnotherWindow.endSheet(self.fileDropWindow)
        
        self.openAnotherWindow.beginSheet(self.openChoiceWindow) { (response: NSModalResponse) in
            
        }
    }
    
    @IBAction func scanQRCode(sender: NSButton) {
        
        let qrImageData: NSData = (self.qrCodeImageView.image?.TIFFRepresentation)!
        
        let qrCIImage: CIImage = CIImage(data: qrImageData)!
        
        var decode = ""
        
        let feautures = detector.featuresInImage(qrCIImage)
        
        for feauture in feautures as! [CIQRCodeFeature] {
            
            decode = feauture.messageString
        }
        
        if decode != "" {
            
            scannedQRCodeMessage.string = decode
        }
        else {
            
            scannedQRCodeMessage.string = "SORRY! NOTHING TO DISPLAY. CHECK YOUR QRCODE IMAGE."
        }
    }
    
    @IBAction func goBackOpenChoiceWindow(sender: NSButton) {
        
        isGoBackEnabled = true
        self.openAnotherWindow.beginSheet(openChoiceWindow) { (response: NSModalResponse) in
            
        }
    }
}
