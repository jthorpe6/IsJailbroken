//
//  IsJailbroken.swift
//  jailbroken
//
//  Created by Joe Thorpe on 04/07/2022.
//

import Foundation

var Jailbroken = false //when the app open the iphone state is not jailbroken because the script has not yet run
var simulate = false //when the app open the simulator  state is not true because the script has not yet run
func IsJailbroken() { //name of the function
#if targetEnvironment(simulator) //just check if the app run on the simulator and change the variable "simulate to true "
    simulate = true
#endif
    
    // array of all the possible locations where jailbroken files may be stored
    let jbFilePaths = [
        "/private/var/lib/apt",
        "/Applications/Cydia.app", // if you can open cydia
        "/Applications/Zebra.app",
        "/Applications/Sileo.app",
        "/Library/PreferenceLoader/",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/Library/MobileSubstrate/DynamicLibraries/PreferenceLoader.dylib",
        "/Library/MobileSubstrate/DynamicLibraries/PreferenceLoader.plist",
        "/Library/MobileSubstrate/DynamicLibraries/RocketBootstrap.dylib",
        "/Library/MobileSubstrate/DynamicLibraries/RocketBootstrap.plist",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt",
        "/usr/bin/ssh"
    ]
    
    for path in jbFilePaths where FileManager.default.isExecutableFile(atPath: path) {
        Jailbroken = true
        return
    }
    
}
