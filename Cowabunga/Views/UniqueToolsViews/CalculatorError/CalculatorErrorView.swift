//
//  CalculatorErrorView.swift
//  Cowabunga
//
//  Created by Hariz Shirazi on 2023-02-14.
//

import SwiftUI

struct CalculatorErrorView: View {
    @State var errorMessage = "Error"
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
                        Button("AC", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: Color(UIColor.lightGray),
                                            foregroundColor: .black)
                                        )

                        Button("±", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: Color(UIColor.lightGray),
                                            foregroundColor: .black)
                                        )
                        Button("%", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: Color(UIColor.lightGray),
                                            foregroundColor: .black)
                                        )
                        Button("÷", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .orange,
                                            foregroundColor: .white)
                                        )
                    }
                    HStack {
                        Button("7", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("8", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("9", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("×", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .orange,
                                            foregroundColor: .white)
                                        )
                    }
                    HStack {
                        Button("4", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("5", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("6", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("+", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .orange,
                                            foregroundColor: .white)
                                        )
                    }
                    HStack {
                        Button("1", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("2", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("3", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("-", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .orange,
                                            foregroundColor: .white)
                                        )
                    }
                    HStack {
                        Button("0", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button(".", action: CalculatorFunctions.nothing)
                            .buttonStyle(CalculatorButtonStyle(
                                            size: 80,
                                            backgroundColor: .secondary,
                                            foregroundColor: .white)
                                        )
                        Button("=", action: CalculatorFunctions.nothing)
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
    }
}

struct CalculatorErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorErrorView()
    }
}
