//
//  CountryDropdown.swift
//  DocVoiceDoctorSwift
//
//  Created by Hushain Khan on 29/09/23.
//

import SwiftUI

struct CountryDropdownView: View {
    
    @ObservedObject var myVM : CountryDropdownViewModel = CountryDropdownViewModel()
    
    @Binding var isDismiss: Bool
    var tapOnItem : ((_ item:CountryCode) -> Void)?
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                Text("Country Code")
                    .font(.largeTitle)
                Spacer()
                Button {
                    isDismiss = false
                } label: {
                    Image(systemName: "multiply")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }
                .frame(width: 44, height: 44)

            }
            .padding(8)
            .onChange(of: myVM.searchText) { newValue in
                myVM.serachCountry(by: newValue)
            }
            
            CountrySearchField(text: $myVM.searchText)
            List {
                ForEach(myVM.arrCountryCode, id: \.CountryCode) { item in
                    CountryDropdownCell(mCountryCode: item, action:tapOnItem)
                }
            }
            .listStyle(.plain)
        }
        
    }
}

struct CountryDropdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDropdownView(isDismiss: .constant(true))
    }
}

struct CountryDropdownCell: View {
    
    var mCountryCode : CountryCode
    
    var action : ((_ item:CountryCode) -> Void)?
    
    var body: some View {
        
        Button {
            action?(mCountryCode)
        } label: {
            HStack {
                if let flag = mCountryCode.flag {
                    Text(flag)
                }
                Text("+\(mCountryCode.PhoneCode)")
                Text(mCountryCode.CountryName )
                Text("(\(mCountryCode.CountryCode))")
                Spacer()
            }
        }
        
    }
    
}

struct CountrySearchField : View {
    
    @Binding var text : String
    
    @FocusState var isActive : Bool
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                   .stroke(( isActive ? Color.accentColor : Color.gray ), lineWidth: 2)
                   .frame( maxHeight:44)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor( isActive ? .accentColor : .gray)
                TextField("Search code heare...", text: $text)
                    .padding()
                    .autocapitalization(.none)
                    .focused($isActive)
            }
            .padding(10)

        }
        .padding(10)
    }
    
}


