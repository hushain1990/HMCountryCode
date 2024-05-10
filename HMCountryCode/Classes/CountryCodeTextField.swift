//
//  CountryCodeTextField.swift
//  HMCountryCode
//
//  Created by Hushain Khan on 10/05/24.
//

import SwiftUI

enum CountryCodeTextFieldType {
    case line
}

public struct CountryCodeTextField: View {
    
    @Binding var mobileNumber : String
    @Binding var mCountryCode : CountryCode
    @Binding var isPopDropdown: Bool
    var placeHolder: String
    var tapOnSelectedCode:((CountryCode) -> Void)?
    
    public init(placeHolder: String ,mobileNumber: Binding<String>, mCountryCode: Binding<CountryCode>, isPopDropdown: Binding<Bool>, tapOnSelectedCode:@escaping ((CountryCode) -> Void)) {
        self._mobileNumber = mobileNumber
        self._mCountryCode = mCountryCode
        self._isPopDropdown = isPopDropdown
        self.tapOnSelectedCode = tapOnSelectedCode
        self.placeHolder = placeHolder
    }
    
    public var body: some View {
        CountryCodeTextField_Line(
            placeholder: placeHolder,
            text: $mobileNumber,
            countryCode: $mCountryCode,
            tapOnCountryCode: {
                isPopDropdown.toggle()
            }
        )
        .fullScreenCover(isPresented: $isPopDropdown) {
            CountryDropdownView(isDismiss: $isPopDropdown) { code in
                mCountryCode = code
                isPopDropdown = false
                tapOnSelectedCode?(code)
            }
        }
    }
    
}

//#Preview {
//    
//    @State var mobileNumber = ""
//    @State var mCountryCode : CountryCode = CountryCodeVM.defaultCountryCode
//    @State var isPopDropdown : Bool = false
//    
//    CountryCodeTextField(mobileNumber: $mobileNumber, mCountryCode: $mCountryCode, isPopDropdown: $isPopDropdown)
//}

