//
//  ContentView.swift
//  FocusBindingPWrapperPOC
//
//  Created by Guru Mahan on 21/02/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var price: Int

    var body: some View {
        VStack{
            VStack {
                OtherView()
                IncreasePriceButton(price: $price)
            }
            FocusValueView()
        }
    }
}

struct OtherView: View {
    @FocusedBinding(\.price) var price: Int?

    var body: some View {
        if let price = price{
            Text("FocusedBinding price = \(String(describing: price))")
        }
    }
}
struct IncreasePriceButton: View {
    @Binding var price: Int

    var body: some View {
        Button("Increase Price") {
            price += 1
            print("price = \(price)")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(price: .constant(0))
    }
}




struct FocusedPriceKey: FocusedValueKey {
    typealias Value = Binding<Int>
}

extension FocusedValues {
    var price: FocusedPriceKey.Value? {
        get { self[FocusedPriceKey.self] }
        set { self[FocusedPriceKey.self] = newValue }
    }
}


