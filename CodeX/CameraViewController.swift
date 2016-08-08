//
//  CameraViewController.swift
//  CodeX
//
//  Created by Maurious Paul on 07/08/16.
//  Copyright © 2016 Themelios. All rights reserved.
//

import Cocoa
import AVFoundation
import Fabric
import Crashlytics

class CameraViewController: NSViewController {

    //List of variables used
    var preView = Preview()
    
    let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
    
    var previewLayer: AVCaptureVideoPreviewLayer!

    var session: AVCaptureSession!
    
    var videoConnection: AVCaptureConnection!
    
    var avCaptureStillImage: AVCaptureStillImageOutput!
    
    let btnTextStyle = NSMutableParagraphStyle()
    
    //List of buttons
    @IBOutlet weak var capturePreviewBtn: NSButton!
    
    @IBOutlet weak var stopPreviewBtn: NSButton!
    
    override func viewWillAppear() {
        
        super.viewWillAppear()
        
        btnTextStyle.alignment = NSTextAlignment.Center
        
        self.preView = Preview(frame: self.view.bounds)
        
        self.view.wantsLayer = true
        
        self.view.addSubview(self.preView)
        
        stopPreviewBtn.attributedTitle = NSAttributedString(string: "CANCEL", attributes: [ NSForegroundColorAttributeName : NSColor(red: 159/255, green: 76/255, blue: 76/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        capturePreviewBtn.attributedTitle = NSAttributedString(string: "CAPTURE IT", attributes: [ NSForegroundColorAttributeName : NSColor(red: 0, green: 171/255, blue: 169/255, alpha: 1.0), NSFontAttributeName: NSFont(name: "Avenir Next Demi Bold", size: 16)!, NSParagraphStyleAttributeName: btnTextStyle ])
        
        self.initCaptureSession()
        
        self.setupPreviewLayer()
        
        if !session.running {
            
            session.startRunning()
        }
        
        appDelegate.openAnotherWindow.qrCodeImageView.image = nil
        
        capturePreviewBtn.enabled = true
    }
    
    func initCaptureSession () -> Void {
        
        session = AVCaptureSession()
        
        var inputDevice: AVCaptureDeviceInput!
        
        if session.canSetSessionPreset(AVCaptureSessionPresetHigh) {
            
            session.sessionPreset = AVCaptureSessionPresetHigh
        }
        
        do {
            
            inputDevice = try AVCaptureDeviceInput(device: AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo)[0] as! AVCaptureDevice)
        } catch _ {
            
            NSLog("No Device Detected")
        }
        
        if session.canAddInput(inputDevice) {
            
            session.addInput(inputDevice)
        }
        else {
            
            NSLog("Can not add Input Device")
        }
    }
    
    func setupPreviewLayer() -> Void {
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: session)
        
        self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.previewLayer.frame = self.view.bounds
        
        self.view.layer?.addSublayer(self.previewLayer)
        
        avCaptureStillImage = AVCaptureStillImageOutput()
        
        avCaptureStillImage.outputSettings = [AVVideoCodecKey:AVVideoCodecJPEG]
        
        if session.canAddOutput(avCaptureStillImage) {
            
            session.addOutput(avCaptureStillImage)
        }
    }
    
    @IBAction func captureImageFromImage(sender: NSButton) {
        
        videoConnection = nil
        
        for connection: AVCaptureConnection  in avCaptureStillImage.connections as! [AVCaptureConnection] {
            
            for port: AVCaptureInputPort in connection.inputPorts as! [AVCaptureInputPort] {
                
                if port.mediaType == AVMediaTypeVideo {
                    
                    videoConnection = connection
                    break
                }
                
                if (videoConnection != nil) {
                    
                    break
                }
            }
        }
        
        avCaptureStillImage.captureStillImageAsynchronouslyFromConnection(videoConnection) { (buffer: CMSampleBuffer!, error: NSError!) in
            
            if buffer != nil {
                
                let imgData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(buffer)
                
                let image = NSImage(data: imgData)!
                
                self.appDelegate.openAnotherWindow.qrCodeImageView.image = image
                
                self.capturePreviewBtn.enabled = false
            }
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            
            self.getPictureAndDismissView()
        }

    }
    
    @IBAction func stopPreviewingAndDismiss(sender: NSButton) {
        
        if session.running {
            
            session.stopRunning()
            
            appDelegate.openAnotherWindow.openAnotherWindow.endSheet(appDelegate.openAnotherWindow.cameraViewWindow)

            appDelegate.openAnotherWindow.openAnotherWindow.beginSheet(appDelegate.openAnotherWindow.openChoiceWindow, completionHandler: { (response: NSModalResponse) in
                
            })
        }
    }
    
    func getPictureAndDismissView() {
        
        if session.running && appDelegate.openAnotherWindow.qrCodeImageView.image != nil {
            
            NSLog("\(appDelegate.openAnotherWindow.qrCodeImageView.image?.hashValue)")
            
            session.stopRunning()
            
            appDelegate.openAnotherWindow.openAnotherWindow.endSheet(appDelegate.openAnotherWindow.cameraViewWindow)
        }
    }
}
