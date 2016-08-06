//
//  CreateNewWindowController.swift
//  CodeX
//
//  Created by Maurious Paul on 04/08/16.
//  Copyright © 2016 Themelios. All rights reserved.
//

import Cocoa

class CreateNewWindowController: NSWindowController {
    
    //List of Windows
    @IBOutlet var createNewWindow: NSWindow!
    
    @IBOutlet var templateWindow: NSWindow!
    
    @IBOutlet var rawDataWindow: NSWindow!
    
    @IBOutlet var vCardWindow: NSWindow!
    
    @IBOutlet var vEventWindow: NSWindow!
    
    @IBOutlet var fbWindow: NSWindow!
    
    @IBOutlet var twitterWindow: NSWindow!
    
    @IBOutlet var linkedinWindow: NSWindow!
    
    @IBOutlet var phoneCallWindow: NSWindow!
    
    @IBOutlet var smsWindow: NSWindow!
    
    @IBOutlet var sendEmailWindow: NSWindow!
    
    @IBOutlet var urlWindow: NSWindow!
    
    @IBOutlet var locationWindow: NSWindow!
    
    @IBOutlet var wifiWindow: NSWindow!
    
    //List of Buttons
    @IBOutlet var rawDataBtn: NSButton!
    
    @IBOutlet var vcardBtn: NSButton!
    
    @IBOutlet var veventBtn: NSButton!
    
    @IBOutlet var fbBtn: NSButton!
    
    @IBOutlet var twitterBtn: NSButton!
    
    @IBOutlet var linkedinBtn: NSButton!
    
    @IBOutlet var phoneCallBtn: NSButton!
    
    @IBOutlet var smsBtn: NSButton!
    
    @IBOutlet var emailBtn: NSButton!
    
    @IBOutlet var urlBtn: NSButton!
    
    @IBOutlet var locationBtn: NSButton!
    
    @IBOutlet var wifiBtn: NSButton!
    
    @IBOutlet var dismissWindowBtn: NSButton!
    
    @IBOutlet var generateBtn: NSButton!
    
    @IBOutlet var dismissCreateNewBtn: NSButton!
    
    @IBOutlet var exportBtn: NSButton!
    
    @IBOutlet var editBtn: NSButton!
    
    @IBOutlet var goBackBtn: NSButton!
    
    @IBOutlet var rawCancel: NSButton!
    
    @IBOutlet var rawOK: NSButton!
    
    @IBOutlet var vcardCancel: NSButton!
    
    @IBOutlet var vcardOK: NSButton!
    
    @IBOutlet var eventCancel: NSButton!
    
    @IBOutlet var eventOK: NSButton!
    
    @IBOutlet var fbCancel: NSButton!
    
    @IBOutlet var fbOK: NSButton!
    
    @IBOutlet var twitterCancel: NSButton!
    
    @IBOutlet var twitterOK: NSButton!
    
    @IBOutlet var smsCancel: NSButton!
    
    @IBOutlet var smsOK: NSButton!
    
    @IBOutlet var linkedinCancel: NSButton!
    
    @IBOutlet var linkedinOK: NSButton!
    
    @IBOutlet var phoneCallCancel: NSButton!
    
    @IBOutlet var phoneCallOK: NSButton!
    
    @IBOutlet var emailCancel: NSButton!
    
    @IBOutlet var emailOK: NSButton!
    
    @IBOutlet var urlCancel: NSButton!
    
    @IBOutlet var urlOK: NSButton!
    
    @IBOutlet var locationCancel: NSButton!
    
    @IBOutlet var locationOK: NSButton!
    
    @IBOutlet var wifiCancel: NSButton!
    
    @IBOutlet var wifiOK: NSButton!
    
    @IBOutlet var eventHasEndDateBtn: NSButton!
    
    @IBOutlet var dontKnowLatLongBtn: NSButton!
    
    //List of variables used
    let btnTextStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()

    var currentTemplate: NSWindow!
    
    var doesEventHaveEnd: Bool = false
    
    var doUserKnowGeoCoords: Bool = true
    
    var qrDataContent: String!
    
    let countryCode = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as! String
    
    var isGoBackEnabled = false

    var encFormat: NSStringEncoding = NSUTF8StringEncoding
    
    var errCorrection: NSString = "L"
    
    var qrColor: CIColor = CIColor(red: 0, green: 0, blue: 0)
    
    var bgColor: CIColor = CIColor(red: 1, green: 1, blue: 1)
    
    var qrImage: NSImage!
    
    var isEditingEnabled = false
    
    let fileTypes = ["jpg", "jpeg", "bmp", "png", "jp2", "tiff", "tif"]
    
    var saveQRCodeImg: NSSavePanel!
    
    //List of other outlets
    @IBOutlet var unitCombo: NSComboBox!
    
    @IBOutlet var widthTxt: NSTextField!
    
    @IBOutlet var heightTxt: NSTextField!
    
    @IBOutlet var reslnCombo: NSComboBox!
    
    @IBOutlet var errorCombo: NSComboBox!
    
    @IBOutlet var encodingCombo: NSComboBox!
    
    @IBOutlet var transparencyCombo: NSComboBox!
    
    @IBOutlet var fgColorWell: NSColorWell!
    
    @IBOutlet var bgColorWell: NSColorWell!
    
    @IBOutlet var qrCodeImageView: NSImageView!
    
    @IBOutlet var saveOptionsPanel: NSPanel!
    
    @IBOutlet var fileTypeCombo: NSComboBox!

    //Raw Data Outlets
    @IBOutlet var rawDataTxt: NSTextField!
    
    //vCard Outlets
    @IBOutlet var fnameTxt: NSTextField!
    
    @IBOutlet var lnameTxt: NSTextField!
    
    @IBOutlet var orgTxt: NSTextField!
    
    @IBOutlet var jobTitleTxt: NSTextField!
    
    @IBOutlet var streetTxt: NSTextField!
    
    @IBOutlet var postalCodeTxt: NSTextField!
    
    @IBOutlet var cityTxt: NSTextField!
    
    @IBOutlet var stateTxt: NSTextField!
    
    @IBOutlet var countryTxt: NSTextField!
    
    @IBOutlet var homePhoneTxt: NSTextField!
    
    @IBOutlet var mobileTxt: NSTextField!
    
    @IBOutlet var faxTxt: NSTextField!
    
    @IBOutlet var emailTxt: NSTextField!
    
    @IBOutlet var urlTxt: NSTextField!
    
    @IBOutlet var birthdayTxt: NSDatePicker!
    
    //vEvent Outlets
    @IBOutlet var eventNameTxt: NSTextField!
    
    @IBOutlet var eventDescTxt: NSTextField!
    
    @IBOutlet var eventLocTxt: NSTextField!
    
    @IBOutlet var eventStartDate: NSDatePicker!
    
    @IBOutlet var eventEndDate: NSDatePicker!
    
    @IBOutlet var eventEndDateLbl: NSTextField!
    
    //Facebook Outlets
    @IBOutlet var fbProfileName: NSTextField!
    
    //Twitter Outlets
    @IBOutlet var twitterProfileName: NSTextField!
    
    //Linkedin Outlets
    @IBOutlet var linkedinProfileName: NSTextField!
    
    //SMS Outlets
    @IBOutlet var recipientNumber: NSTextField!
    
    @IBOutlet var smsMessage: NSTextField!
    
    //Phone Call Outlets
    @IBOutlet var callerNumber: NSTextField!
    
    //Email Outlets
    @IBOutlet var recipientEmail: NSTextField!
    
    @IBOutlet var emailSubject: NSTextField!
    
    @IBOutlet var emailMessage: NSTextField!
    
    //URL Outlets
    @IBOutlet var webAddress: NSTextField!
    
    //Location Outlets
    @IBOutlet var latitudeTxt: NSTextField!
    
    @IBOutlet var longitudeTxt: NSTextField!
    
    @IBOutlet var locationAddrTxt: NSTextField!
    
    //Wifi Outlets
    @IBOutlet var ssidTxt: NSTextField!
    
    @IBOutlet var wifiPasswdTxt: NSTextField!
    
    @IBOutlet var networkTypeCombo: NSComboBox!
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        NSLog("WindowLoaded")
        
        btnTextStyle.alignment = NSTextAlignment.Center
        
        let OK: NSAttributedString = NSAttributedString(string: "OK", attributes: [ NSForegroundColorAttributeName : NSColor(red: 105/255, green: 155/255, blue: 76/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let Cancel: NSAttributedString = NSAttributedString(string: "CANCEL", attributes: [ NSForegroundColorAttributeName : NSColor(red: 159/255, green: 76/255, blue: 76/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let eventHasEndDateTxt: NSAttributedString = NSAttributedString(string: "EVENT HAS END DATE", attributes: [ NSForegroundColorAttributeName : NSColor(red: 154/255, green: 18/255, blue: 179/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let dontKnowLatLongTxt: NSAttributedString = NSAttributedString(string: "I DON'T KNOW LATITUDE/LONGITUDE", attributes: [ NSForegroundColorAttributeName : NSColor(red: 246/255, green: 36/255, blue: 89/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        generateBtn.attributedTitle = NSAttributedString(string: "GENERATE QR CODE", attributes: [ NSForegroundColorAttributeName : NSColor(red: 38/255, green: 194/255.0, blue: 129/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        goBackBtn.attributedTitle = NSAttributedString(string: "GO BACK", attributes: [ NSForegroundColorAttributeName : NSColor(red: 186/255, green: 161/255, blue: 132/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        exportBtn.attributedTitle = NSAttributedString(string: "EXPORT AS IMAGE", attributes: [ NSForegroundColorAttributeName : NSColor(red: 1.0, green: 164/255, blue: 0, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        editBtn.attributedTitle = NSAttributedString(string: "EDIT DETAILS", attributes: [ NSForegroundColorAttributeName : NSColor(red: 93/255, green: 63/255, blue: 106/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        dismissCreateNewBtn.attributedTitle =  NSAttributedString(string: "CANCEL", attributes: [ NSForegroundColorAttributeName : NSColor(red: 159/255, green: 76/255, blue: 76/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])

        let rawDataTxt = NSAttributedString(string: "RAW DATA", attributes: [ NSForegroundColorAttributeName : NSColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let vcardTxt = NSAttributedString(string: "VCARD", attributes: [ NSForegroundColorAttributeName : NSColor(red: 30/255, green: 130/255, blue: 76/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let veventTxt = NSAttributedString(string: "EVENT", attributes: [ NSForegroundColorAttributeName : NSColor(red: 154/255, green: 18/255, blue: 179/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])

        let fbTxt = NSAttributedString(string: "FACEBOOK", attributes: [ NSForegroundColorAttributeName : NSColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let twitterTxt = NSAttributedString(string: "TWITTER", attributes: [ NSForegroundColorAttributeName : NSColor(red: 0, green: 172/255, blue: 237/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let linkedinTxt = NSAttributedString(string: "LINKEDIN", attributes: [ NSForegroundColorAttributeName : NSColor(red: 72/255, green: 117/255, blue: 180/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let phoneTxt = NSAttributedString(string: "CALL", attributes: [ NSForegroundColorAttributeName : NSColor(red: 27/255, green: 188/255, blue: 155/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let smsTxt = NSAttributedString(string: "SMS", attributes: [ NSForegroundColorAttributeName : NSColor(red: 249/255, green: 105/255, blue: 14/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let emailTxt = NSAttributedString(string: "EMAIL", attributes: [ NSForegroundColorAttributeName : NSColor(red: 145/255, green: 61/255, blue: 136/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let urlTxt = NSAttributedString(string: "URL", attributes: [ NSForegroundColorAttributeName : NSColor(red: 219/255, green: 10/255, blue: 91/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let locationTxt = NSAttributedString(string: "LOCATION", attributes: [ NSForegroundColorAttributeName : NSColor(red: 246/255, green: 36/255, blue: 89/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let wifiTxt = NSAttributedString(string: "WIFI", attributes: [ NSForegroundColorAttributeName : NSColor(red: 242/255, green: 38/255, blue: 19/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        let cancelTxt = NSAttributedString(string: "CANCEL", attributes: [ NSForegroundColorAttributeName : NSColor(red: 159/255, green: 76/255, blue: 76/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 14)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        
        self.templateWindow.backgroundColor = NSColor.whiteColor()
        
        self.templateWindow.alphaValue = 0.95
        
        self.createNewWindow.orderFrontRegardless()
        
        self.createNewWindow.alphaValue = 0.95
        
        self.createNewWindow.titlebarAppearsTransparent = true
        
        self.createNewWindow.backgroundColor = NSColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 1.0)
        
        self.createNewWindow.beginSheet(self.templateWindow, completionHandler: { (response: NSModalResponse) in
            
        })
        
        rawDataBtn.attributedTitle = rawDataTxt
        
        vcardBtn.attributedTitle = vcardTxt
        
        veventBtn.attributedTitle = veventTxt
        
        fbBtn.attributedTitle = fbTxt
        
        twitterBtn.attributedTitle = twitterTxt
        
        linkedinBtn.attributedTitle = linkedinTxt
        
        phoneCallBtn.attributedTitle = phoneTxt
        
        smsBtn.attributedTitle = smsTxt
        
        emailBtn.attributedTitle = emailTxt
        
        urlBtn.attributedTitle = urlTxt
        
        locationBtn.attributedTitle = locationTxt
        
        wifiBtn.attributedTitle = wifiTxt
        
        dismissWindowBtn.attributedTitle = cancelTxt
        
        rawOK.attributedTitle = OK
        
        rawCancel.attributedTitle = Cancel
        
        vcardOK.attributedTitle = OK
        
        vcardCancel.attributedTitle = Cancel
        
        eventOK.attributedTitle = OK
        
        eventCancel.attributedTitle = Cancel
        
        fbOK.attributedTitle = OK
        
        fbCancel.attributedTitle = Cancel
        
        twitterOK.attributedTitle = OK
        
        twitterCancel.attributedTitle = Cancel
        
        linkedinOK.attributedTitle = OK
        
        linkedinCancel.attributedTitle = Cancel
        
        phoneCallOK.attributedTitle = OK
        
        phoneCallCancel.attributedTitle = Cancel
        
        smsOK.attributedTitle = OK
        
        smsCancel.attributedTitle = Cancel
        
        emailOK.attributedTitle = OK
        
        emailCancel.attributedTitle = Cancel
        
        urlOK.attributedTitle = OK
        
        urlCancel.attributedTitle = Cancel
        
        locationOK.attributedTitle = OK
        
        locationCancel.attributedTitle = Cancel
        
        wifiOK.attributedTitle = OK
        
        wifiCancel.attributedTitle = Cancel
        
        eventHasEndDateBtn.attributedTitle = eventHasEndDateTxt
        
        dontKnowLatLongBtn.attributedTitle = dontKnowLatLongTxt
    }
    
    @IBAction func dismissCreateNewWindow(sender: NSButton) {
        
        if isGoBackEnabled {
            
            self.createNewWindow.endSheet(self.templateWindow)
            
            isGoBackEnabled = false
        }
        else {
        
            self.createNewWindow.endSheet(self.templateWindow)
        
            self.createNewWindow.close()
        
            NSApplication.sharedApplication().windows.first?.makeKeyAndOrderFront(self)
        
            NSApplication.sharedApplication().activateIgnoringOtherApps(true)
            
            isGoBackEnabled = false
        }
    }
    
    @IBAction func showRawDataWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.rawDataWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.rawDataWindow
    }
    
    @IBAction func showvCardWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.vCardWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.vCardWindow
    }
    
    @IBAction func showvEventWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.vEventWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.vEventWindow
    }
    
    @IBAction func showFBWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.fbWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.fbWindow
    }
    
    @IBAction func showTwitterWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.twitterWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.twitterWindow
    }
    
    @IBAction func showLinkedinWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.linkedinWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.linkedinWindow
    }
    
    @IBAction func showPhoneCallWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.phoneCallWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.phoneCallWindow
    }
    
    @IBAction func showSMSWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.smsWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.smsWindow
    }
    
    @IBAction func showEmailWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.sendEmailWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.sendEmailWindow
    }
    
    @IBAction func showURLWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.urlWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.urlWindow
    }
    
    @IBAction func showLocationWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.locationWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.locationWindow
    }
    
    @IBAction func showWifiWindow(sender: NSButton) {
        
        self.createNewWindow.endSheet(self.templateWindow)
        
        self.createNewWindow.beginSheet(self.wifiWindow) { (response: NSModalResponse) in
            
        }
        
        self.currentTemplate = self.wifiWindow
    }
    
    @IBAction func dismissTemplateWindow(sender: NSButton) {
        
        if isEditingEnabled {
            
            self.createNewWindow.endSheet(currentTemplate)
            isEditingEnabled = false
        }
        else {
            
            self.createNewWindow.endSheet(currentTemplate)
            self.createNewWindow.beginSheet(createNewWindow) { (response: NSModalResponse) in
                
            }
        }
    }
    
    @IBAction func showWorkWindowFromRawData(sender: NSButton) {
        
        self.qrDataContent = self.rawDataTxt.stringValue
        
        if self.qrDataContent != "" {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(rawDataWindow)
            self.currentTemplate = rawDataWindow
        }
    }
    
    @IBAction func showWorkWindowFromvCard(sender: NSButton) {
        
        let bDateFormatter: NSDateFormatter = NSDateFormatter()
        
        bDateFormatter.dateFormat = "yyyyMMdd"
        
        let dateString: String = bDateFormatter.stringFromDate(self.birthdayTxt.dateValue)
        
        self.qrDataContent = "BEGIN:VCARD\nVERSION:3.0\nN:\(self.lnameTxt.stringValue);\(self.fnameTxt.stringValue);;;\nFN:\(self.fnameTxt.stringValue) \(self.lnameTxt.stringValue)\nORG:\(self.orgTxt.stringValue)\nTITLE:\(self.jobTitleTxt.stringValue)\nADR:;;\(self.streetTxt.stringValue);\(self.cityTxt.stringValue);\(self.stateTxt.stringValue);\(self.postalCodeTxt.stringValue);\(self.countryTxt.stringValue)\nTEL;WORK;VOICE:\(self.homePhoneTxt.stringValue)\nTEL;CELL:\(self.mobileTxt.stringValue)\nTEL;FAX:\(self.faxTxt.stringValue)\nEMAIL;WORK;INTERNET:\(self.emailTxt.stringValue)\nURL:\(self.urlTxt.stringValue)\nBDAY:\(dateString)\nEND:VCARD"
        
        if self.qrDataContent != "" {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(vCardWindow)
            self.currentTemplate = self.vCardWindow
        }
    }
    
    @IBAction func showWorkWindowFormvEvent(sender: NSButton) {
        
        let eDateFormatter: NSDateFormatter = NSDateFormatter()
        
        eDateFormatter.dateFormat = "yyyyMMddHHmmss"
        
        let eventStartDateString = eDateFormatter.stringFromDate(self.eventStartDate.dateValue)
        
        let eventEndDateString = eDateFormatter.stringFromDate(self.eventEndDate.dateValue)
        
        if self.doesEventHaveEnd {
            
            self.qrDataContent = "BEGIN:VEVENT\nSUMMARY:\(self.eventNameTxt.stringValue)\nDESCRIPTION:\(self.eventDescTxt.stringValue)\n LOCATION:\(self.eventLocTxt.stringValue)\nDTSTART:\(eventStartDateString)\nDTEND:\(eventEndDateString)\nEND:VEVENT"
        }
        else{
            
            self.qrDataContent = "BEGIN:VEVENT\nSUMMARY:\(self.eventNameTxt.stringValue)\nDESCRIPTION:\(self.eventDescTxt.stringValue)\n LOCATION:\(self.eventLocTxt.stringValue)\nDTSTART:\(eventStartDateString)\nEND:VEVENT"
        }
        
        if self.qrDataContent != "" && self.eventNameTxt.stringValue != "" {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(vEventWindow)
            self.currentTemplate = self.vEventWindow
        }
    }
    
    @IBAction func doesEventHaveEndDate(sender: NSButton) {
        
        if doesEventHaveEnd {
            
            sender.image = NSImage(named: "CHKUFILL")
            
            self.eventEndDate.hidden = true
            
            self.eventEndDateLbl.hidden = true
            
            self.doesEventHaveEnd = false
        }
        else {
        
            sender.image = NSImage(named: "CHKFILL")
            
            self.eventEndDate.hidden = false
            
            self.eventEndDateLbl.hidden = false
            
            self.doesEventHaveEnd = true
        }
    }
    
    @IBAction func showWorkWindowFromFB(sender: NSButton) {
        
        self.qrDataContent = "https://www.facebook.com/\(self.fbProfileName.stringValue)"
        
        if(self.fbProfileName.stringValue != "") {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(fbWindow)
            self.currentTemplate = self.fbWindow
        }
    }
    
    @IBAction func showWorkWindowFromTwitter(sender: NSButton) {
        
        self.qrDataContent = "https://twitter.com/\(self.twitterProfileName.stringValue)"
        
        if(self.twitterProfileName.stringValue != "") {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(twitterWindow)
            self.currentTemplate = self.twitterWindow
        }
    }
    
    @IBAction func showWorkWindowFromSMS(sender: NSButton) {
        
        self.qrDataContent = "smsto:\(self.recipientNumber.stringValue):\(self.smsMessage.stringValue)"
        
        if self.recipientNumber.stringValue != "" {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(smsWindow)
            self.currentTemplate = self.smsWindow
        }
    }
    
    @IBAction func showWorkWindowFromLinkedin(sender: NSButton) {
        
        self.qrDataContent = "https://linkedin.com/\(self.countryCode.lowercaseString)/\(self.linkedinProfileName.stringValue)"
        
        if(self.linkedinProfileName.stringValue != "") {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(linkedinWindow)
            self.currentTemplate = self.linkedinWindow
        }
    }
    
    @IBAction func showWorkWindowFromPhoneCall(sender: NSButton) {
        
        self.qrDataContent = "tel:\(self.callerNumber.stringValue)"
        
        if self.callerNumber.stringValue != "" {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(phoneCallWindow)
            self.currentTemplate = self.phoneCallWindow
        }
    }
    
    @IBAction func showWorkWindowFromEmail(sender: NSButton) {
        
        self.qrDataContent = "mailto:\(self.recipientEmail.stringValue)?subject=\(self.emailSubject.stringValue)&body=\(self.emailMessage.stringValue)"
        
        if self.recipientEmail.stringValue != "" {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(sendEmailWindow)
            self.currentTemplate = self.sendEmailWindow
        }
    }
    
    @IBAction func showWorkWindowFromURL(sender: NSButton) {
        
        self.qrDataContent = self.webAddress.stringValue
        if self.qrDataContent != "" {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(urlWindow)
            self.currentTemplate = self.urlWindow
        }
    }
    
    @IBAction func showWorkWindowFromLocation(sender: NSButton) {
        
        if self.doUserKnowGeoCoords {
            
            self.qrDataContent = "http://maps.google.com/maps?q=\(self.latitudeTxt.stringValue),\(self.longitudeTxt.stringValue)"
            
            if self.latitudeTxt.stringValue != "" && longitudeTxt.stringValue != "" {
                
                NSLog(self.qrDataContent)
                self.createNewWindow.endSheet(locationWindow)
                self.currentTemplate = self.locationWindow
            }
        }
        else {
            
            self.qrDataContent = "http://maps.google.com/maps?q=\(self.locationAddrTxt.stringValue)"
            
            if self.locationAddrTxt.stringValue != "" {
                
                NSLog(self.qrDataContent)
                self.createNewWindow.endSheet(locationWindow)
                self.currentTemplate = self.locationWindow
            }
        }
    }
    
    @IBAction func doUserKnowLatLong(sender: NSButton) {
        
        if doUserKnowGeoCoords {
         
            sender.image = NSImage(named: "CHKLFILL")
            
            self.locationAddrTxt.hidden = false
            
            self.latitudeTxt.enabled = false
            
            self.longitudeTxt.enabled = false
            
            self.doUserKnowGeoCoords = false
        }
        else {
            
            sender.image = NSImage(named: "CHKLUFILL")
            
            self.locationAddrTxt.hidden = true
            
            self.latitudeTxt.enabled = true
            
            self.longitudeTxt.enabled = true
            
            self.doUserKnowGeoCoords = true
        }
    }
    
    @IBAction func showWorkWindowFromWifi(sender: NSButton) {
        
        self.qrDataContent = "WIFI:S:\(self.ssidTxt.stringValue);T:\(self.networkTypeCombo.stringValue);P:\(self.wifiPasswdTxt.stringValue);;"
        
        if ssidTxt.stringValue != "" && self.networkTypeCombo.stringValue != "" {
            
            NSLog(self.qrDataContent)
            self.createNewWindow.endSheet(wifiWindow)
            self.currentTemplate = self.wifiWindow
        }
    }
    
    @IBAction func checkForOpenNetwork(sender: NSComboBox) {
        
        if sender.indexOfSelectedItem == 0 {
            
            self.wifiPasswdTxt.enabled = false
        }
        else {
            
            self.wifiPasswdTxt.enabled = true
        }
    }
    
    func generateQRCodeImg() -> NSImage {
        
        var qrWidth: Double = 255.1185
        
        var qrHeight: Double = 255.1185
        
        var outputImage: CIImage!
        
        if self.unitCombo.indexOfSelectedItem == 0 {
            
            qrWidth = self.pointToMM(self.widthTxt.doubleValue)
            
            qrHeight = self.pointToMM(self.heightTxt.doubleValue)
        }
        else if self.unitCombo.indexOfSelectedItem == 1 {
            
            qrWidth = self.pointToInch(self.widthTxt.doubleValue)
            
            qrHeight = self.pointToInch(self.heightTxt.doubleValue)
        }
        else if self.unitCombo.indexOfSelectedItem == 2 {
            
            qrWidth = self.widthTxt.doubleValue
            
            qrHeight = self.heightTxt.doubleValue
        }
        
        let qrFilter: CIFilter = CIFilter(name: "CIQRCodeGenerator")!
        
        let qrData: NSData = self.qrDataContent.dataUsingEncoding(self.encFormat)!
        
        qrFilter.setDefaults()
        
        qrFilter.setValue(self.errCorrection, forKey: "inputCorrectionLevel")
        
        qrFilter.setValue(qrData, forKey: "inputMessage")
        
        let colorFilter: CIFilter = CIFilter(name: "CIFalseColor")!
        
        colorFilter.setDefaults()
        
        colorFilter.setValue(qrFilter.outputImage!, forKey: "inputImage")
        
        if self.transparencyCombo.indexOfSelectedItem == 0 {
            
            let transparentBG: CIColor = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            
            colorFilter.setValue(qrColor, forKey: "inputColor0")
            
            colorFilter.setValue(transparentBG, forKey: "inputColor1")
            
            outputImage = colorFilter.outputImage!
        }
        else {
            
            colorFilter.setValue(qrColor, forKey: "inputColor0")
            
            colorFilter.setValue(bgColor, forKey: "inputColor1")
            
            outputImage = colorFilter.outputImage!
        }
        
        let scaleX = CGFloat(qrWidth) / outputImage.extent.size.width
        
        let scaleY = CGFloat(qrHeight) / outputImage.extent.size.height
        
        let transformedImg = outputImage.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        
        let context: CIContext = CIContext(options: nil)
        
        let ciImage = context.createCGImage(transformedImg, fromRect: transformedImg.extent)
        
        self.qrImage = NSImage(CGImage: ciImage, size: NSSize(width: qrWidth, height: qrHeight))
        
        return self.qrImage
    }
    
    func pointToMM(value: Double) -> Double {
        
        return value * 2.83465
    }
    
    func pointToInch(value: Double) -> Double {
        
        return value * 72.0
    }
    
    @IBAction func generateQRCodeImage(sender: NSButton) {
        
        if encodingCombo.indexOfSelectedItem == 0 {
            encFormat = NSUTF8StringEncoding
        }
        else{
            encFormat = NSISOLatin1StringEncoding
        }
        
        if errorCombo.indexOfSelectedItem == 0{
            errCorrection = "L"
        }
        else if errorCombo.indexOfSelectedItem == 1{
            errCorrection = "M"
        }
        else if errorCombo.indexOfSelectedItem == 2{
            errCorrection = "Q"
        }
        else{
            errCorrection = "H"
        }
        
        self.qrColor = CIColor(red: self.fgColorWell.color.redComponent, green: self.fgColorWell.color.greenComponent, blue: self.fgColorWell.color.blueComponent, alpha: self.fgColorWell.color.alphaComponent)
        
        self.bgColor = CIColor(red: self.bgColorWell.color.redComponent, green: self.bgColorWell.color.greenComponent, blue: self.bgColorWell.color.blueComponent, alpha: self.bgColorWell.color.alphaComponent)
        
        qrCodeImageView.image = generateQRCodeImg()
        
        if self.qrCodeImageView.image != nil {
            
            self.exportBtn.enabled = true
        }
    }
    
    @IBAction func exportQRCodeAsImg(sender: NSButton) {
        
        self.saveQRCodeImg = NSSavePanel()
        
        var directoryPath: NSString!
        
        var imageSavePath: String!
        
        var fileType = "png"
        
        self.saveQRCodeImg.accessoryView = saveOptionsPanel.contentView
        
        self.saveQRCodeImg.nameFieldStringValue = "Untitled"
        
        self.saveQRCodeImg.beginSheetModalForWindow(self.createNewWindow) { (response: Int) in
            
            if response == NSModalResponseOK {
                
                directoryPath = self.saveQRCodeImg.directoryURL?.path
                
                if self.fileTypeCombo.indexOfSelectedItem == 1 {
                    
                    fileType = "jpg"
                }
                else if self.fileTypeCombo.indexOfSelectedItem == 2 {
                    
                    fileType = "tiff"
                }
                else if self.fileTypeCombo.indexOfSelectedItem == 3 {
                    
                    fileType = "jp2"
                }
                else if self.fileTypeCombo.indexOfSelectedItem == 4 {
                    
                    fileType = "bmp"
                }
                else {
                    
                    fileType = "png"
                }
                
                imageSavePath = directoryPath.stringByAppendingString("/\(self.saveQRCodeImg.nameFieldStringValue).\(fileType)")
                
                NSLog(imageSavePath)
                
                self.saveImgFile(imageSavePath, type: fileType)
            }
        }
    }
    
    @IBAction func editDetails(sender: NSButton) {
        
        self.isEditingEnabled = true
        self.createNewWindow.beginSheet(currentTemplate) { (response: NSModalResponse) in
            
        }
    }
    
    @IBAction func goBackToTemplates(sender: NSButton) {
        
        self.isGoBackEnabled = true
        
        self.createNewWindow.beginSheet(templateWindow) { (response: NSModalResponse) in
        }
    }
    
    @IBAction func dismissWorkWindow(sender: NSButton) {
                
        self.createNewWindow.close()
        
        NSApplication.sharedApplication().windows.first?.makeKeyAndOrderFront(self)
        
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
    }
    
    func saveImgFile(imagePath: String, type: String) {
        
        if let imgData = self.qrImage.TIFFRepresentation {
            
            if let imgRep = NSBitmapImageRep(data: imgData) {
                
                if type == "jpg" {
                    
                    if let pngImgData = imgRep.representationUsingType(NSBitmapImageFileType.NSJPEGFileType, properties: [:]) {
                        
                        pngImgData.writeToFile(imagePath, atomically: false)
                    }
                }
                else if type == "tiff" {
                    
                    if let pngImgData = imgRep.representationUsingType(NSBitmapImageFileType.NSTIFFFileType, properties: [:]) {
                        
                        pngImgData.writeToFile(imagePath, atomically: false)
                    }
                }
                else if type == "jp2" {
                    
                    if let pngImgData = imgRep.representationUsingType(NSBitmapImageFileType.NSJPEG2000FileType, properties: [:]) {
                        
                        pngImgData.writeToFile(imagePath, atomically: false)
                    }
                }
                else if type == "bmp" {
                    
                    if let pngImgData = imgRep.representationUsingType(NSBitmapImageFileType.NSBMPFileType, properties: [:]) {
                        
                        pngImgData.writeToFile(imagePath, atomically: false)
                    }
                }
                else {
                    
                    if let pngImgData = imgRep.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: [:]) {
                        
                        pngImgData.writeToFile(imagePath, atomically: false)
                    }
                }
            }
        }
    }
}
