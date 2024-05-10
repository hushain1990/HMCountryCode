//
//  CountryCodeTextField_Line.swift
//  HMCountryCode
//
//  Created by Hushain Khan on 10/05/24.
//

import SwiftUI

struct CountryCodeTextField_Line: View {
    
    var placeholder: String = ""
    
    @Binding var text: String
    @Binding var countryCode : CountryCode
    
    var tapOnCountryCode:(()->())?
    
    @FocusState private var isActive: Bool
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                HStack {
                    Text(countryCode.flag ?? "")
                    Text("+\(countryCode.PhoneCode)")
                    //.font(.custom(.regular, size: 20.0))
                }
                
                .onTapGesture {
                    tapOnCountryCode?()
                }
                
                Divider()
                    .frame(width: 1.5)
                    .overlay( (isActive ? Color.accentColor : Color.gray) )
                
                TextField(placeholder, text: $text)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .focused($isActive)
                    .keyboardType(.numberPad)
                
                
            }
            
            Divider()
                .frame(height: 1.5)
                .overlay( (isActive ? Color.accentColor : Color.gray))
            
            
        }
        .frame(height: 46)
        
    }
}
