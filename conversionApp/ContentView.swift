//
//  ContentView.swift
//  conversionApp
//
//  Created by Josileudo on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0
    @State private var tipTemperature = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var tipLenght = ["meters", "kilometers", "feet", "yards", "miles"]
    @State private var tipTime = ["seconds", "minutes", "hours", "days"]
    @State private var tipVolume = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    @State private var inputLenghtSelect = ""
    @State private var outputLenghtSelect = ""
    
//    func convertLenght() -> Double {
//        switch inputLenghtSelect {
//        case "meters":
//            return
//        
//        return 0
//    }
    
    var body: some View {
        NavigationStack {
            Form {
                // MARK: Input value
                Section("Value") {
                    TextField("Input your value", value: $inputValue, format: .number)
                }
                
                // MARK: Tips choose
                Section("Input") {
                    Picker("Light mensure", selection: $inputLenghtSelect) {
                        ForEach(tipLenght, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output") {
                    Picker("Output light", selection: $outputLenghtSelect) {
                        ForEach(tipLenght, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                // MARK: Result
                Section("Result") {
                    Text("\(inputValue)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
