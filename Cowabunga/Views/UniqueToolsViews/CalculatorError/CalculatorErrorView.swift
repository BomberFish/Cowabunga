//
//  CalculatorErrorView.swift
//  Cowabunga
//
//  Created by Hariz Shirazi on 2023-02-14.
//

import SwiftUI

struct CalculatorErrorView: View {
    @State var errorMessage = "Error"
    @State var leet = ""
    struct CalculatorButtonStyle: ButtonStyle {
        var sizex: CGFloat
        var sizey: CGFloat
        var backgroundColor: Color
        var foregroundColor: Color
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 32, weight: .medium))
                .frame(width: sizex, height: sizey)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .clipShape(Capsule())
        }
    }
    
    // Thanks suslocation! :trolleytools:
    var calculatorBundleURL: URL? = {
        let apps = {
            do {
                return try ApplicationManager.getApps().first(where: { $0.bundleIdentifier == "com.apple.calculator" })?.bundleURL
            } catch {
                // :trollface:
                UIApplication.shared.alert(body: "Unable to find calculator app. Maybe you're on an iPad? :trollface:")
                return URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")
            }
            
        }()
        return apps
    }()

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
                        .font(.system(size: 64))
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
    }
    
    // TODO: Everything.
    func setName(value: String) {
        Haptic.shared.play(.heavy)
        let calculatorBundlePath: String? = calculatorBundleURL?.absoluteString
        UIApplication.shared.alert(title: "Not Implemented", body: value + ", " + (calculatorBundlePath ?? "Not Found") + "")
    }
    
    // FIXME: what on god's green earth
    func nothing() {
        Haptic.shared.play(.medium)
        print("nope")
        leet = ""
    }
    // funny.
    func something(number: String) {
        Haptic.shared.play(.medium)
        print("yep")
        leet = leet + number
        print(leet)
        if leet == "1337" {
            Haptic.shared.notify(.success)
            UIApplication.shared.alert(title: "Access Granted", body: "Welcome, Neo")
            leet = ""
        }
    }
}

struct CalculatorErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorErrorView()
    }
}
