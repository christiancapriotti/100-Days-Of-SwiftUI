//
//  ContentView.swift
//  UnitConverter
//
//  Created by Christian Capriotti on 9/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 32.0
    @State private var inputUnit: Dimension = UnitLength.meters
    @State private var outputUnit: Dimension = UnitLength.kilometers
    @State private var selectedUnit = "Length"
    
    private var outputValue: String {
        let inputMeasurement = Measurement(value: inputValue, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return formatter.string(from: outputMeasurement)
    }
    
    private let formatter: MeasurementFormatter
    private let units = ["Length", "Mass", "Duration", "Temperature"]
    private let unitsDict: [String: [Dimension]] = [
        "Length" : [UnitLength.meters, UnitLength.kilometers, UnitLength.miles, UnitLength.feet, UnitLength.yards],
        "Mass" : [UnitMass.kilograms, UnitMass.pounds, UnitMass.grams, UnitMass.ounces],
        "Duration" : [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.milliseconds, UnitDuration.hours],
        "Temperature" : [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
    ]
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 5
        formatter.numberFormatter = numberFormatter
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Value to convert") {
                    TextField("Input value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Picker("Conversion type", selection: $selectedUnit) {
                        ForEach(units, id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: selectedUnit) { _, newValue in
                        let units = unitsDict[newValue] ?? []
                        inputUnit = units[0]
                        outputUnit = units[1]
                    }
                    
                    Picker("Convert from", selection: $inputUnit) {
                        ForEach(unitsDict[selectedUnit] ?? [], id: \.symbol) { unit in
                            Text(formatter.string(from: unit).capitalized).tag(unit)
                        }
                    }
                    
                    Picker("Convert to", selection: $outputUnit) {
                        ForEach(unitsDict[selectedUnit] ?? [], id: \.symbol) { unit in
                            Text(formatter.string(from: unit).capitalized).tag(unit)
                        }
                    }
                }
                
                Section("Result") {
                    let inputValueFormatted = formatter.string(
                        from: Measurement(
                            value: inputValue,
                            unit: inputUnit
                        )
                    )
                    
                    Text("\(inputValueFormatted) is \(outputValue)")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
