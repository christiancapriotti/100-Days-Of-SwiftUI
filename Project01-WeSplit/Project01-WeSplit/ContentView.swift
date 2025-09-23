import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    @State private var people = 2
    @State private var tipPercentage = 15

    @FocusState private var amountIsFocused: Bool

    private var currencyCode: String { Locale.current.currency?.identifier ?? "USD" }

    private var splitAmount: Double {
        let tip = amount * Double(tipPercentage) / 100
        let total = amount + tip
        return total / Double(people)
    }

    private var totalWithTip: Double {
        amount + (amount * Double(tipPercentage) / 100)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount",
                              value: $amount,
                              format: .currency(code: currencyCode)
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)

                    Picker("Number of people", selection: $people) {
                        ForEach(2..<51, id: \.self) {
                            Text($0, format: .number).tag($0)
                        }
                    }
                }

                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent).tag($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }

                Section("Totals") {
                    HStack {
                        Text("Total with tip")
                        Spacer()
                        Text(totalWithTip, format: .currency(code: currencyCode))
                    }
                    HStack {
                        Text("Per person")
                        Spacer()
                        Text(splitAmount, format: .currency(code: currencyCode))
                    }
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
