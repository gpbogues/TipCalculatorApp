//
//  ContentView.swift
//  TipCalculatorApp
//
//  Created by Gannon Bogues on 1/30/25.
//

import SwiftUI

struct TipCalculatorView: View{
    @State private var billAmount: Double = 0.0
    @State private var tipPercentage: Double = 15.0
    @State private var numberOfPeople: Double = 1.0
    @State private var showResults: Bool = false
    
    var tipAmount: Double {
        return billAmount * (tipPercentage/100)
    }
    
    var totalAmount: Double {
        return billAmount + tipAmount
    }
    
    var amountPerPerson: Double {
        return totalAmount/numberOfPeople
    }
    
    var body: some View{
        VStack(spacing: 20){
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            VStack(alignment: .leading){
                Text("Bill Amount: \(billAmount, format: .currency(code: "USD"))")
                Slider(value: $billAmount, in: 0...500, step: 1)
            }
            VStack(alignment: .leading){
                Text("Tip Percentage: \(Int(tipPercentage))%")
                Slider(value: $tipPercentage, in: 0...30, step: 1)
            }
            .padding()
            VStack(alignment: .leading){
                Text("Number of People: \(Int(numberOfPeople))")
                Slider(value: $numberOfPeople, in: 1...20, step: 1)
            }
            .padding()
            
            if showResults{
                VStack{
                    Text("Tip Amount: \(tipAmount, format: .currency(code: "USD"))")
                    Text("Total Amount: \(totalAmount, format: .currency(code: "USD"))")
                    Text("Amount per person: \(amountPerPerson, format: .currency(code: "USD"))")
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            Button(action: {
                showResults.toggle()
            }) {
                Text(showResults ? "Hide Results" : "Calculate")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(showResults ? Color.red : Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

struct TipCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TipCalculatorView()
    }
 }
