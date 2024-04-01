//
//  InsuranceCard.swift
//  CrissCard
//
//  Created by Arika Nicole Handy on 10/3/23.
//

import SwiftUI

struct InsuranceCard: View {
    
    @State var fieldEntry = ""
    var body: some View {
        Text("Insurance Company")
        TextField("Insert your Insurance Company here", text: $fieldEntry)
        Text("Insurance ID Number")
        TextField("Insert your Insurance ID Number here", text: $fieldEntry)
        Text("Insurance Group Number")
        TextField("Insert your Insurance Group Number here", text: $fieldEntry)
        Text("Primary Doctor")
        TextField("Insert your Primary Doctor here", text: $fieldEntry)
        Text("Doctor's Phone Number")
        TextField("Insert your Doctor's Phone Number here", text: $fieldEntry)
    }
}

#Preview {
    FieldView(fieldName: "test")
}
