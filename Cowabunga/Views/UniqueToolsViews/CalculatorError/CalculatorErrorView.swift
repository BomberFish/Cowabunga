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
        
        var size: CGFloat
        var backgroundColor: Color
        var foregroundColor: Color
        
        func makeBody(configuration: Configuration) -> some View {
                configuration.label
                    .font(.system(size: 32, weight: .medium))
                    .frame(width: size, height: size)
                    .background(backgroundColor)
                    .foregroundColor(foregroundColor)
                    .clipShape(Capsule())
        }
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
                                            size: 80,
                                            backgroundColor: Color(UIColor.lightGray),
                                            foregroundColor: .black)
                                        )

                        Button("±", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: Color(UIColor.lightGray),
                                            foregroundColor: .black)
                                        )
                        Button("%", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: Color(UIColor.lightGray),
                                            foregroundColor: .black)
                                        )
                        Button("÷", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .orange,
                                            foregroundColor: .white)
                                        )
                    }
                    HStack {
                        Button("7", action: {something(number: "7")})
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("8", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("9", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("×", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .orange,
                                            foregroundColor: .white)
                                        )
                    }
                    HStack {
                        Button("4", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("5", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("6", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("+", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .orange,
                                            foregroundColor: .white)
                                        )
                    }
                    HStack {
                        Button("1", action: {something(number: "1")})
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("2", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("3", action: {something(number: "3")})
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("-", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .orange,
                                            foregroundColor: .white)
                                        )
                    }
                    HStack {
                        Button("0", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button(".", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("=", action: nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .orange,
                                            foregroundColor: .white)
                                        )
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .preferredColorScheme(.light)
        
        .toolbar {
            Button(action:{
                setName(value: errorMessage)
            },label:{
                Image(systemName: "checkmark")
            })
        }
    }
    
    // TODO: Everything.
    func setName(value: String) {
        Haptic.shared.play(.heavy)
        UIApplication.shared.alert(title: "Not Implemented" ,body: "Message: " + value)
    }
    
    // FIXME: what on god's green earth
    func nothing() {
       Haptic.shared.play(.light)
       print("nope")
        leet = ""
    }
    func something(number: String) {
        Haptic.shared.play(.medium)
        print("yep")
        leet = leet + number
        if leet == "1337" {
            Haptic.shared.notify(.success)
            UIApplication.shared.alert(title: "Access Granted" ,body: "Welcome, Neo")
            leet = ""
        }
    }
}

struct CalculatorErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorErrorView()
    }
}
