//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Alisha Carrington on 01/08/2025.
//

// show total cost and place order

import SwiftUI

struct CheckoutView: View {
    @Bindable var order: Order
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "GBP"))")
                    .font(.title)
                
                Button("Place Order") {
                    // call asynchronous func
                    Task {
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(order.errorOccurred == false ? "Thank you!" : "Sorry!", isPresented: $order.showingAlert) {
            Button("OK") { }
        } message: {
            Text(order.alertMessage)
        }
    }
    
    func placeOrder() async {
        // try and convert the current order to JSON data
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        // where to send the request
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        // create a URLRequest object
        var request = URLRequest(url: url)
        // configure it to send JSON data using a HTTP POST request
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")  // api key
        request.httpMethod = "POST"
        
        do {
            // make the network request
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            // try and convert the order from JSON to Order type
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            order.alertTitle = "Thank you!"
            order.alertMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            order.showingAlert = true
        } catch {
            order.alertTitle = "Sorry!"
            order.alertMessage = "Error ordering your cupcakes - please try again later."
            order.errorOccurred = true
            order.showingAlert = true
            print("Checkout failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
