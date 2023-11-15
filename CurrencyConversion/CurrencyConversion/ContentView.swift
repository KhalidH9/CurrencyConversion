import SwiftUI

struct ContentView: View {
    @State private var amount: Double = 0
    @State private var selectedCurrency = "SAR"
    
    let currencies = ["SAR", "EUR"]
    let exchangeRate: Double = 0.80
    
    var convertedAmount: Double {
        if selectedCurrency == "SAR" {
            return amount * 0.25
        } else {
            return amount * 3.50
        }
    }
    
    var Rate: Double {
        return amount / convertedAmount
    }
    
    var totalAmount: Double {
        return Rate + convertedAmount
    }
    
    var body: some View {
        ScrollView{
            VStack {
                Text("Currency Converter")
                    .font(.largeTitle)
                    .foregroundStyle(Color.black)
                Text("You can convert between Saudi Riyal and Euro as well as calculating the exchange rate.")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.gray)
            }
            .frame(width: 301, height: 200, alignment: .bottom)
            .padding()
            
            Spacer()
            
            VStack{
                Text("Enter the value below:")
                    .font(.headline)
                    .foregroundStyle(Color.black)
                TextField("Enter amount", value: $amount, formatter: NumberFormatter())
                    .padding(.horizontal)
            }
            .frame(width: 301, height: 100, alignment: .center)
            .padding(.horizontal)
            
            Picker("Select currency", selection: $selectedCurrency) {
                ForEach(currencies, id: \.self) { currency in
                    Text(currency)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            
            VStack{
                Text("Converted amount: \(convertedAmount, specifier: "%.2f")")
                    .font(.title3)
                    .foregroundStyle(Color.green)
                    .padding(.horizontal)
                
                Text("Exchange Rate: \(Rate, specifier: "%.2f")")
                    .font(.title3)
                    .foregroundStyle(Color.green)
                    .padding(.horizontal)
                
                Text("Total Amount: \(totalAmount, specifier: "%.2f")")
                    .font(.title3)
                    .foregroundStyle(Color.green)
                    .padding(.horizontal)
            }
            Spacer()
            
            VStack{
                Text("""
                 Important notes:
                 1 SAR = 0.25
                 1 EUR = 3.50 SAR
                 Exchange Rate: Original value / New value
                 """)
            }
            .frame(width: .infinity, height: 200, alignment: .bottomLeading)
            //.multilineTextAlignment(.center)
            .font(.callout)
            .foregroundStyle(Color.red)
            .padding(.horizontal)
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
