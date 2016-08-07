//
//  FileDropView.swift
//  CodeX
//
//  Created by Maurious Paul on 06/08/16.
//  Copyright © 2016 Themelios. All rights reserved.
//

import Cocoa

class FileDropView: NSView {
    
    let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
    
    var fileTypeIsOk = false
    
    var droppedFilePath: String?
    
    let fileTypes = ["jpg", "jpeg", "bmp", "png", "jp2", "tiff", "tif"]
    
    override init(frame frameRect: NSRect) {
        
        super.init(frame: frameRect)
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        registerForDraggedTypes([NSFilenamesPboardType, NSURLPboardType, NSPasteboardTypeTIFF])
    }
    
    override func draggingEntered(sender: NSDraggingInfo) -> NSDragOperation {
        
        if checkFileExtension(sender) {
            
            fileTypeIsOk = true
                        
            return .Copy
        }
        else {
            
            fileTypeIsOk = false
            
            return .None
        }
    }
    
    override func draggingUpdated(sender: NSDraggingInfo) -> NSDragOperation {
        
        if fileTypeIsOk {
            
            return .Copy
        }
        else {
            
            return .None
        }
    }
    
    override func performDragOperation(sender: NSDraggingInfo) -> Bool {
        
        if let board = sender.draggingPasteboard().propertyListForType("NSFilenamesPboardType") as? NSArray, imagePath = board[0] as? String {
            
            droppedFilePath = imagePath
            
            return true
        }
        
        return false
    }
    
    func checkFileExtension(drag: NSDraggingInfo) -> Bool {
        
        let openAnotherWindow = appDelegate.openAnotherWindow
        
        if let board = drag.draggingPasteboard().propertyListForType("NSFilenamesPboardType") as? NSArray,
            path = board[0] as? String {
            
            let url: NSURL = NSURL(fileURLWithPath: path)
            
            if let fileExtension = url.pathExtension?.lowercaseString {
                
                self.droppedFilePath = url.path!
                
                NSLog(self.droppedFilePath!)
                
                if fileTypes.contains(fileExtension) {
                    
                    openAnotherWindow.fileStatusImageView.image = NSImage(named: "FILEOK")
                    
                    return true
                }
                else {
                    
                    openAnotherWindow.fileStatusImageView.image = NSImage(named: "FILENOTOK")
                    
                    return false
                }
            }
        }
        return false
    }
}
