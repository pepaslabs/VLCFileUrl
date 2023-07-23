//
//  AppDelegate.swift
//  VLCFileUrl
//
//  Created by Jason Pepas on 7/23/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    
    func application(_ application: NSApplication, open urls: [URL]) {
        for url in urls {
            let httpUrlString = url.absoluteString.replacingOccurrences(
                of: "vlc-file://",
                with: "http://"
            )
            let job = Process()
            job.executableURL = URL(fileURLWithPath: "/usr/bin/open")
            job.arguments = ["-a", "VLC", httpUrlString]
            try? job.run()
            job.waitUntilExit()
        }
        NSApp.terminate(self)
    }
}
