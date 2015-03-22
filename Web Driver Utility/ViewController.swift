//
//  ViewController.swift
//  Web Driver Utility
//
//  Created by Michal Olszewski on 22.03.2015.
//  Copyright (c) 2015 Olszewski. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var driverFileNameLabel: NSTextField!
    var driverFilePath: NSURL?
    
    @IBAction func openDriverFile(sender: AnyObject) {
        var openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = ["pkg"]
        openPanel.prompt = "Select"
        openPanel.beginWithCompletionHandler{(result) -> Void in
            if result == NSFileHandlingPanelOKButton {
                if openPanel.URLs.count == 1 {
                    self.driverFileNameLabel.hidden = false
                    if let text = openPanel.URL?.lastPathComponent {
                        self.driverFileNameLabel.stringValue = text
                    }
                    self.driverFilePath = openPanel.URL?.standardizedURL
                }else{
                    self.driverFileNameLabel.hidden = false
                    self.driverFileNameLabel.stringValue = "Select valid driver file"
                    self.driverFilePath = nil
                }
                
            }
        }
    }

}

