//
//  ProfilePicture.swift
//  CrissCard
//
//  Created by Arika Nicole Handy on 10/4/23.
//

import SwiftUI
import PhotosUI

struct ProfilePicture: View{
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State private var showSheet = false
    
    
    var body: some View {
        VStack {
            PhotosPicker("Edit photo", selection: $avatarItem, matching: .images)
            
            
            if let avatarImage {
                avatarImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Button("Delete photo") {
                    avatarItem = nil
                }
            }
            
            
            
        }
        .onChange(of: avatarItem) {
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                        return
                    }
                } else {
                    avatarImage = nil
                }
            }
        }
    }
}
#Preview {
    ProfilePicture()
}
