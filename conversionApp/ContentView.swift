//
//  ContentView.swift
//  conversionApp
//
//  Created by Josileudo on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var tipLenght = ["meters", "kilometers", "feet", "yards", "miles"]
    
    @State private var inputLenghtSelect = "meters"
    @State private var outputLenghtSelect = "kilometers"
    
    // MARK: Return unit lenght
    func typeMeasurement(type: String) -> UnitLength {
        switch (type) {
        case "kilometers":
            return .kilometers
        case "feet":
            return .feet
        case "yards":
            return .yards
        case "miles":
            return .miles
        default:
            return .meters
        }
    }
    
    // MARK: Conversion value
    func resultConversion() -> Measurement<UnitLength> {
        let input = Measurement(value: inputValue, unit: typeMeasurement(type: inputLenghtSelect))
        let output = typeMeasurement(type: outputLenghtSelect)
        
        return input.converted(to: output)
    }
    
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
                
                // MARK: Output convesion
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
                    Text("\(resultConversion().value.formatted())")
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
