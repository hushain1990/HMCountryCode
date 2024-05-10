//
//  ExampleView.swift
//  HMCountryCode_Example
//
//  Created by Hushain Khan on 10/05/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import HMCountryCode

struct ExampleView: View {

    @ObservedObject var myVM  = ExampleViewModel()
    
    var body: some View {
        CountryCodeTextField(placeHolder: "Enter your mobile number",
                             mobileNumber: $myVM.mobileNumber,
                             mCountryCode: $myVM.mCountryCode,
                             isPopDropdown: $myVM.isPopDropdown) { code in
            
        }
    }
}

#Preview {
    ExampleView()
}

class ExampleViewModel : ObservableObject {
    
    @Published var mobileNumber = ""
    @Published var mCountryCode : CountryCode = CountryCode.defaultCountryCode
    @Published var isPopDropdown : Bool = false
    
}

