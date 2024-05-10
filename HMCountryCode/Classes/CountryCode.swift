//
//  CountryCode.swift
//  DocVoiceDoctorSwift
//
//  Created by Hushain Khan on 29/09/23.
//

import Foundation

public class CountryCode: Codable {

    public var PhoneCode: String
    public var CountryCode: String
    public var CountryName: String
    
    init(PhoneCode: String, CountryCode: String, CountryName: String) {
        self.PhoneCode = PhoneCode
        self.CountryCode = CountryCode
        self.CountryName = CountryName
    }
    
}

extension CountryCode {
    
    public var flag: String? {
        get {
            if let flag = flagEmoji(for: CountryCode ) {
                return flag
            }
            return nil
        }
    }
    
    public static var defaultCountryCode: CountryCode {
        return CountryCodeVM.defaultCountryCode
    }
    
    private func flagEmoji(for countryCode: String) -> String? {
        let base : UInt32 = 127397
        var flagString = ""
        for s in countryCode.unicodeScalars {
            guard let scalar = UnicodeScalar(base + s.value) else {
                return nil
            }
            flagString.append(String(scalar))
        }
        return flagString
    }
    
}
