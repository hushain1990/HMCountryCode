//
//  CountryDropdownViewModel.swift
//  DocVoiceDoctorSwift
//
//  Created by Hushain Khan on 29/09/23.
//

import Foundation
import SwiftUI
import Combine


class CountryDropdownViewModel : ObservableObject {
    
    @Published var arrCountryCode : [CountryCode] = []
    @Published var searchText: String = ""
    
    private var arrAllCountryCode: [CountryCode] = []
    
    init() {
        readJson()
    }
    
    private func readJson() {
        
        weak var this = self
        let mCountryCodeVM = CountryCodeVM()
        mCountryCodeVM.getCountryCode { arr in
            
            this?.arrAllCountryCode.removeAll()
            this?.arrAllCountryCode = arr
            
            this?.arrCountryCode.removeAll()
            this?.arrCountryCode = arr
            
        }
        
    }
    
    func serachCountry(by text: String) {
        arrCountryCode.removeAll()
        if text.isEmpty {
            arrCountryCode = arrAllCountryCode
        } else {
            arrCountryCode = arrAllCountryCode.filter({
                $0.CountryCode.localizedCaseInsensitiveContains(text)
                || "+\($0.PhoneCode)".localizedCaseInsensitiveContains(text)
                || $0.CountryName.localizedCaseInsensitiveContains(text)
            })
        }
    }
    
}



