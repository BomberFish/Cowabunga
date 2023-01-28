//
//  ExtraFunctions.swift
//  Cowabunga
//
//  Created by Hariz Shirazi on 2023-01-28.
//

import Foundation

// MARK: - plist editing function (string)
func plistChangeStr(plistPath: String, key: String, value: String) {
    let stringsData = try! Data(contentsOf: URL(fileURLWithPath: plistPath))
    
    let plist = try! PropertyListSerialization.propertyList(from: stringsData, options: [], format: nil) as! [String: Any]
    func changeValue(_ dict: [String: Any], _ key: String, _ value: String) -> [String: Any] {
        var newDict = dict
        for (k, v) in dict {
            if k == key {
                newDict[k] = value
            } else if let subDict = v as? [String: Any] {
                newDict[k] = changeValue(subDict, key, value)
            }
        }
        return newDict
    }

    var newPlist = plist
    newPlist = changeValue(newPlist, key, value)

    let newData = try! PropertyListSerialization.data(fromPropertyList: newPlist, format: .binary, options: 0)

    overwriteFileWithDataImpl(originPath: plistPath, replacementData: newData)
}

// MARK: - plist editing function (integer)
func plistChangeInt(plistPath: String, key: String, value: Int) {
let stringsData = try! Data(contentsOf: URL(fileURLWithPath: plistPath))

let plist = try! PropertyListSerialization.propertyList(from: stringsData, options: [], format: nil) as! [String: Any]
func changeValue(_ dict: [String: Any], _ key: String, _ value: Int) -> [String: Any] {
    var newDict = dict
    for (k, v) in dict {
        if k == key {
            newDict[k] = value
        } else if let subDict = v as? [String: Any] {
            newDict[k] = changeValue(subDict, key, value)
        }
    }
    return newDict
}

var newPlist = plist
newPlist = changeValue(newPlist, key, value)

let newData = try! PropertyListSerialization.data(fromPropertyList: newPlist, format: .binary, options: 0)

    overwriteFileWithDataImpl(originPath: plistPath, replacementData: newData)
}
// MARK: - Mute tile Functions


// MARK: Enable CC tile
func EnableMute() {
    DispatchQueue.global(qos: .userInteractive).async {
        let data = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4gPCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXBwbGUvL0RURCBQTElTVCAxLjAvL0VOIiAiaHR0cDovL3d3dy5hcHBsZS5jb20vRFREcy9Qcm9wZXJ0eUxpc3QtMS4wLmR0ZCI+IDxwbGlzdCB2ZXJzaW9uPSIxLjAiPiA8ZGljdD4gPGtleT5TQkljb25WaXNpYmlsaXR5PC9rZXk+IDx0cnVlLz4gPC9kaWN0PiA8L3BsaXN0Pgo="
        overwriteFileWithDataImpl(originPath: "/var/Managed Preferences/mobile/com.apple.control-center.MuteModule.plist", replacementData: try! Data(base64Encoded: data)!);
    }
}

// MARK: Disable CC tile
func DisableMute() {
    DispatchQueue.global(qos: .userInteractive).async {
        let data = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPCFET0NUWVBFIHBsaXN0IFBVQkxJQyAiLS8vQXBwbGUvL0RURCBQTElTVCAxLjAvL0VOIiAiaHR0cDovL3d3dy5hcHBsZS5jb20vRFREcy9Qcm9wZXJ0eUxpc3QtMS4wLmR0ZCI+CjxwbGlzdCB2ZXJzaW9uPSIxLjAiPgo8ZGljdD4KCTxrZXk+U0JJY29uVmlzaWJpbGl0eTwva2V5PgoJPGZhbHNlLz4KPC9kaWN0Pgo8L3BsaXN0Pgo="
        overwriteFileWithDataImpl(originPath: "/var/Managed Preferences/mobile/com.apple.control-center.MuteModule.plist", replacementData: try! Data(base64Encoded: data)!);
    }
}
