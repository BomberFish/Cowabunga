//
//  CalculatorErrorView.swift
//  Cowabunga
//
//  Created by Hariz Shirazi on 2023-02-14.
//

import SwiftUI
import MacDirtyCowSwift

struct CalculatorErrorView: View {
    @State var errorMessage = "Error"
    @State var leet = ""
    @State var savedCalcURL = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    struct CalculatorButtonStyle: ButtonStyle {
        var sizex: CGFloat
        var sizey: CGFloat
        var backgroundColor: Color
        var foregroundColor: Color
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 32, weight: .regular))
                .frame(width: sizex, height: sizey)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .clipShape(Capsule())
        }
    }
    
    // Thanks lemin!
    func getCalculatorURL() throws -> URL {
        if savedCalcURL != "" {
            return URL(fileURLWithPath: savedCalcURL)
        }
        
        let appDataPath = "/var/containers/Bundle/Application"
        for url in try FileManager.default.contentsOfDirectory(at: URL(fileURLWithPath: appDataPath), includingPropertiesForKeys: []) {
            do {
                let plist = try PropertyListSerialization.propertyList(from: try Data(contentsOf: url.appendingPathComponent(".com.apple.mobile_container_manager.metadata.plist")), options: [], format: nil) as! [String: Any]
                if plist["MCMMetadataIdentifier"] != nil && plist["MCMMetadataIdentifier"]! as! String == "com.apple.calculator" {
                    savedCalcURL = url.path
                    return url
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        throw "Could not find calculator url"
    }
    
    var body: some View {
        ZStack {
            Color.black
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Spacer()
                    TextField("Error", text: $errorMessage)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                        .padding(.horizontal, 24)
                        .font(.system(size: 64, weight: .regular))
                        .minimumScaleFactor(0.5)
                        .frame(height: 80)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                // FIXME: Probably a better way to do this :cowatrolley:
                VStack {
                    HStack {
                        Button("AC", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.lightGray),
                                foregroundColor: .black)
                            )
                        
                        Button("±", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.lightGray),
                                foregroundColor: .black)
                            )
                        Button("%", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.lightGray),
                                foregroundColor: .black)
                            )
                        Button("÷", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: .orange,
                                foregroundColor: .white)
                            )
                    }
                    HStack {
                        Button("7", action: { something(number: "7") })
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("8", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("9", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("×", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: .orange,
                                foregroundColor: .white)
                            )
                    }
                    HStack {
                        Button("4", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("5", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("6", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("+", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: .orange,
                                foregroundColor: .white)
                            )
                    }
                    HStack {
                        Button("1", action: { something(number: "1") })
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("2", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("3", action: { something(number: "3") })
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("-", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: .orange,
                                foregroundColor: .white)
                            )
                    }
                    HStack {
                        Button(action: nothing, label: {
                            Text("0")
                                .padding(.trailing, 85)
                            
                        })
                        .buttonStyle(CalculatorButtonStyle(
                            sizex: 170,
                            sizey: 80,
                            backgroundColor: Color(UIColor.darkGray),
                            foregroundColor: .white)
                        )
                        Button(".", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: Color(UIColor.darkGray),
                                foregroundColor: .white)
                            )
                        Button("=", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                sizex: 80,
                                sizey: 80,
                                backgroundColor: .orange,
                                foregroundColor: .white)
                            )
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
        .toolbar {
            Button(action: {
                setName(value: errorMessage)
            }, label: {
                Image(systemName: "checkmark")
            })
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                do {
                    try getCalculatorURL()
                } catch {
                    UIApplication.shared.confirmAlert(body: "Unable to find calculator app. Maybe you're on an iPad? :trollface:", onOK:{self.mode.wrappedValue.dismiss()}, noCancel: true)
                }
            }
            
        }
    }
    
    // TODO: Everything.
    func setName(value: String) {
        // and heres the kicker
        Haptic.shared.play(.heavy)
        let success = plistChangeStr(plistPath: savedCalcURL + "/Calculator.app/Localizable.loctable", key: "Error", value: value)
        if success {
            Haptic.shared.notify(.success)
            UIApplication.shared.alert(title: "Success!", body: "Successfully set error message!")
        } else {
            Haptic.shared.notify(.error)
            UIApplication.shared.alert(body: "Error when setting error message! How ironic...")
        }
    }
    
    // FIXME: what on god's green earth
    func nothing() {
        Haptic.shared.play(.light)
        print("nope")
        leet = ""
    }
    // funny.
    func something(number: String) {
        Haptic.shared.play(.light)
        print("yep")
        leet = leet + number
        print(leet)
        if leet == "1337" {
            Haptic.shared.notify(.success)
            UIApplication.shared.alert(title: "Access Granted", body: "Welcome, Neo")
            leet = ""
        }
    }
    // FIXME: Crashes.
    func plistChangeStr(plistPath: String, key: String, value: String) -> Bool {
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
        return MDC.overwriteFile(at: plistPath, with: newData)
    }

}

struct CalculatorErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorErrorView()
    }
}
