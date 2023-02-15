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
                        Button("±", action: CalculatorFunctions.nothing)
                        Button("%", action: CalculatorFunctions.nothing)
                        Button("÷", action: CalculatorFunctions.nothing)
                    }
                    HStack {
                        Button("7", action: CalculatorFunctions.nothing)
                        Button("8", action: CalculatorFunctions.nothing)
                        Button("9", action: CalculatorFunctions.nothing)
                        Button("×", action: CalculatorFunctions.nothing)
                    }
                    HStack {
                        Button("4", action: CalculatorFunctions.nothing)
                        Button("5", action: CalculatorFunctions.nothing)
                        Button("6", action: CalculatorFunctions.nothing)
                        Button("+", action: CalculatorFunctions.nothing)
                    }
                    HStack {
                        Button("0", action: CalculatorFunctions.nothing)
                        Button(".", action: CalculatorFunctions.nothing)
                        Button("=", action: CalculatorFunctions.nothing)
                    }
                    HStack {
                        Button("5", action: CalculatorFunctions.nothing)
                        Button("5", action: CalculatorFunctions.nothing)
                        Button("5", action: CalculatorFunctions.nothing)
                        Button("5", action: CalculatorFunctions.nothing)
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
