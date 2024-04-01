//
//  ContentView.swift
//  CrissCard
//
//  Created by Arika Nicole Handy on 10/2/23.
//

import SwiftUI
import PhotosUI

struct Fields: Identifiable, Hashable {
    let  name: String
    let id = UUID()
}
struct ContentView: View {
    @State private var showingSheet = false
    @State private var isShowingMedicalSheet = false
    @State private var firstlast: String = ""
    @State private var street: String = ""
    @State private var username: String = ""
    @State private var multiSelection = [Fields]()
    @State private var MedicalSheet: String = ""
    @State private var medicalHistories = [Medical]()
    
    
    private var fields = [
        Fields(name:"Nickname"),
        Fields(name:"Date of Birth"),
        Fields(name:"Emergency Contact"),
        Fields(name:"Medical History"),
        Fields(name:"Insurance Card"),
        Fields(name:"Allergies"),
        Fields(name:"Height"),
        Fields(name:"Weight"),
        Fields(name:"Organ Donor"),
        Fields(name:"Emergency Color"),
        Fields(name:"Blood Type"),
        Fields(name:"Other"),]
    
    
    //  func delete(at offsets: IndexSet) {
    //   users.remove(atOffsets: offsets)
    // }
    // @State private var users = ["Name", "Address", "Phone Number"]
    var body: some View {
       ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
                .foregroundColor(.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .padding(.all)
                    .ignoresSafeArea()
                    .foregroundColor(.white)
               )
                .overlay(
                    VStack{
                        Image("Title")
                            .scaleEffect(x:0.50,y:0.50)
                        ProfilePicture.init()
                        NavigationStack{
                            VStack {
                                
                                //Image(systemName: "person.crop.square")
                                // .scaleEffect(x:15,y:15)
                            }
                            
                            
                            
                            /*if let secondPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                             
                             if let picker == imagePicker  {
                             self.profileImagePhoto.image = secondPickedImage
                             }
                             else {
                             self.coverImagePhoto.image = secondPickedImage
                             }
                             
                             }
                             
                             picker.dismiss(animated: true, completion: nil)
                             }*/
                            List {
                                Text("Name")
                                TextField("First and Last Name", text: $firstlast)
                                Text("Address")
                                TextField("Street name", text: $street)
                                Text("Phone Number")
                                TextField("Cell Number", text: $username)
                                ForEach(multiSelection, id: \.self){ field in
                                    FieldView(fieldName: field.name)
                                }
                                DisclosureGroup("Medical History") {
                                    //TODO: store the medical history as an array to access it in a foreach loop
                                    //                        ForEach(medicalHistories) { medicalHistory in
                                    //                            Text(medicalHistory.name)
                                    //                        }
                                }
                                Button("Add more fields"){
                                    showingSheet = true
                                }
                            }
                            .listStyle(.inset)
                            
                        }
                        .sheet(isPresented: $showingSheet){
                            NavigationView{
                                List(fields) { field in
                                    Button{
                                        if field.name == "Medical History" {
                                            isShowingMedicalSheet = true
                                        }
                                        if multiSelection.contains(field) {
                                            multiSelection = multiSelection.filter { $0 != field }
                                        } else {
                                            multiSelection.append(field)
                                        }
                                    } label: {
                                        HStack {
                                            // if the id of the field is in the set. show the "checkmark.diamond" image. otherwise, show the diamond image
                                            if(multiSelection.contains(field)){
                                                Image(systemName: "checkmark.diamond")
                                                Text(field.name)
                                            } else {
                                                Image(systemName: "diamond")
                                                Text(field.name)
                                            }
                                        }
                                    }
                                }
                                .navigationTitle("Fields")
                                .sheet(isPresented: $isShowingMedicalSheet){
                                    MedicalSheetView(medicalHistories: $medicalHistories)
                                    Button("Done"){
                                        isShowingMedicalSheet = false
                                    }
                                }
                                .toolbar {
                                    Button("Done"){
                                        showingSheet = false
                                    }
                                }
                                
                            }
                            Text("\(multiSelection.count) selctions")
                        }
                        .toolbar {
                            EditButton()
                            
                            
                        }
                        .padding()
                    })
       }
    }
}
#Preview {
    ContentView()
}
