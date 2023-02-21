//
//  FocusBindingPWrapperPOCApp.swift
//  FocusBindingPWrapperPOC
//
//  Created by Guru Mahan on 21/02/23.
//

import SwiftUI

@main
struct FocusBindingPWrapperPOCApp: App {
    @State private var price = 0

    var body: some Scene {
        
        WindowGroup {
        //if FocusedValue(\.price) != nil {
                 ContentView(price: $price)
                     .focusedSceneValue(\.price, $price)
           //  }else{
            //    FocusValueView()
           // }
        }
        
    }
}
