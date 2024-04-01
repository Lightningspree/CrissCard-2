//
//  MedicalSheet.swift
//  CrissCard
//
//  Created by Arika Nicole Handy on 10/3/23.
//

import SwiftUI

struct Medical: Identifiable, Hashable {
    let name: String
    let id = UUID()
}
struct MedicalSheetView: View {
    @Binding var medicalHistories: [Medical]
    @State private var isShowingMedicalSheet = false
    let medical = [
        Medical(name:"Anemia"),
        Medical(name:"Asthma"),
        Medical(name:"Bleeding Disorder"),
        Medical(name:"Cancer"),
        Medical(name:"Cardiac disease"),
        Medical(name:"Diabetes"),
        Medical(name:"Emotional Disorder"),
        Medical(name:"Epilepsy"),
        Medical(name:"Hearing Impaired"),
        Medical(name:"Heart Attack"),
        Medical(name:"Hypertension"),
        Medical(name:"Psychiatric Disorder"),
        Medical(name:"Vision Impaired"),
        Medical(name:"Other")
    ]
    var body: some View {
                    NavigationView{
                        List(medical) { medical in
                            Button{
                                if medicalHistories.contains(medical) {
                                    medicalHistories = medicalHistories.filter { $0 != medical }
                                } else {
                                    medicalHistories.append(medical)
                                }
                            }label: {
                    
                                HStack {
                                    // if the id of the field is in the set. show the "checkmark.diamond" image. otherwise, show the diamond image
                                    if(medicalHistories.contains(medical)){
                                        Image(systemName: "checkmark.diamond")
                                        Text(medical.name)
                                            //.onDelete(uncheck)
                                    }
                                    else{
                                        Image(systemName: "diamond")
                                        Text(medical.name)
                                    }
                                }
                        }
                        .navigationTitle("Medical")
                     
                        
                    }
                        /*.toolbar {
                            Button("Done"){
                                isShowingMedicalSheet = false
                            }
                        }*/
                    Text("\(medicalHistories.count) selctions")
                } 
        
    }
}

//#Preview {
//    MedicalSheetView(medicalHistories: .constant([]))
//}
