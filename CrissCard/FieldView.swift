//
//  FieldView.swift
//  CrissCard
//
//  Created by Arika Nicole Handy on 10/3/23.
//

import SwiftUI

struct FieldView: View {
    let fieldName: String
    @State var fieldEntry = ""
    var body: some View {
        if(fieldName == "Medical History"){
            
        }
        if(fieldName == "Insurance Card"){
            InsuranceCard()
        }
        else{
            Text(fieldName)
            TextField("Insert your \(fieldName) here", text: $fieldEntry)
        }
    }
}

#Preview {
    FieldView(fieldName: "test")
}
