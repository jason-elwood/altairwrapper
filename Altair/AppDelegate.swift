//
//  AppDelegate.swift
//  Altair
//
//  Created by Jason Elwood on 8/8/16.
//  Copyright © 2016 Jason Elwood. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    var appInstalled:Bool = true

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        if appInstalled {
            
            let bundlePath = NSBundle.mainBundle().pathForResource("altairApp", ofType: "")
            print(bundlePath, "\n") //prints the correct path
            let destPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
            let fileManager = NSFileManager.defaultManager()
            let fullDestPath = NSURL(fileURLWithPath: destPath).URLByAppendingPathComponent("altairApp")
            let fullDestPathString = fullDestPath.path
            print(fileManager.fileExistsAtPath(bundlePath!)) // prints true
            print("Copied to: \(fullDestPathString!)")
            
            do{
                try fileManager.copyItemAtPath(bundlePath!, toPath: fullDestPathString!)
            }catch{
                print("\n")
                print(error)
            }
            
            if appInstalled {
                system("open \(fullDestPathString!)")
                _ = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(AppDelegate.terminateSelf), userInfo: nil, repeats: false)
            } else {
                // Install app.
            }
            
        }
        
        
    }
    
    func terminateSelf() {
        exit(0)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

