//
//  RegistrationView.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import SwiftUI

struct RegistrationView: View {
    @State private var avatar: UIImage?
    @State private var name = ""
    @State private var login = ""
    @State private var password = ""
    @State private var showedSelectPhotoView = false
    
    var body: some View {
        ScrollView {
            VStack {
                Image(uiImage: avatar ?? UIImage(systemName: "person.fill")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .onTapGesture {
                        showedSelectPhotoView = true
                    }
                

                TextField("Name", text: $name)
                    .padding(8)
                
                TextField("Login", text: $login)
                    .padding(8)
                
                SecureField("Password", text: $password)
                    .padding(8)
                
                Button("Registration") {
                    print("Login: \(login), Password: \(password)")
                }
                .padding()
            }
            .padding(.vertical, 16)
        }
        .fullScreenCover(isPresented: $showedSelectPhotoView) {
            SelectPhotoView(image: $avatar)
        }
    }
}
