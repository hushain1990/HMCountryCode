//
//  CountryCodeVM.swift
//  DocVoiceDoctorSwift
//
//  Created by Hushain Khan on 29/09/23.
//

import Foundation

class CountryCodeVM {
    
    func getCountryCode(complitionHandler : ([CountryCode]) -> Void) {
        guard let arr = readCountryJson() else {
            complitionHandler([])
            return
        }
        complitionHandler(arr)
    }
    
    func getCountryByCode(_ code: String? = "US", complitionHandler : (CountryCode) -> Void) {
        if let code = code,
           (code == "US"
            || code.isEmpty) {
            complitionHandler(CountryCodeVM.defaultCountryCode)
        }
        guard let arr = readCountryJson(),
              let mCode = arr.first(where: { $0.CountryCode.localizedCaseInsensitiveContains(code ?? "US") })
        else {
            complitionHandler(CountryCodeVM.defaultCountryCode)
            return
        }
        
        complitionHandler(mCode)
    }
    
    
}

extension  CountryCodeVM {
    
    static var defaultCountryCode : CountryCode {
        get {
            return CountryCode(PhoneCode: "1", CountryCode: "US", CountryName: "United States of America")
        }
    }
    
    private func readCountryJson() -> [CountryCode]? {
        if let jsonData = readJSONFile(fileName: "CountryCode") {
            do {
                
                let decoder = JSONDecoder()
                let arr = try decoder.decode([CountryCode].self, from: jsonData)
                return arr
            } catch {
                print("Error decoding JSON: \(error)")
            }
            return nil
        }
        return nil
    }
    
    private func readJSONFile(fileName: String) -> Data? {
        let bundle = Bundle(for: CountryCodeVM.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                print("Error reading JSON file: \(error)")
                return nil
            }
        }
        return nil
    }
    
}
