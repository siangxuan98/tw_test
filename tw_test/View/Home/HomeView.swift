//
//  HomeView.swift
//  tw_test
//
//  Created by Naik Siang Xuan on 06/02/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        
        List {
            ForEach($viewModel.data, id: \.id) { countryObject in
                
                NavigationLink(destination: VStack {
                    Text("ID :  \(countryObject.id.wrappedValue ?? "-")").font(Font.custom(Constant().poppinsMedium, size: 14))
                    Text("First Name :  \(countryObject.firstName.wrappedValue ?? "-")").font(Font.custom(Constant().poppinsMedium, size: 14))
                    Text("Last Name :  \(countryObject.lastName.wrappedValue ?? "-")").font(Font.custom(Constant().poppinsMedium, size: 14))
                    Text("Email :  \(countryObject.email.wrappedValue ?? "-")").font(Font.custom(Constant().poppinsMedium, size: 14))
                    Text("DOB :  \(countryObject.dob.wrappedValue ?? "-")").font(Font.custom(Constant().poppinsMedium, size: 14))
                }) {
                    Text((countryObject.firstName.wrappedValue ?? "-") + " " + (countryObject.lastName.wrappedValue ?? "-")).font(Font.custom(Constant().poppinsRegular, size: 12))
                }
                
            }
        }
        
    }
}

struct SearchBarView: View {
    
    @Binding var searchText: String
    @State var searchBarIsEditing: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Capsule(style: .circular)
                .frame(width: screen.width - 64, height: 48)
                .foregroundColor(.black.opacity(0.5))
                .overlay(
                    Capsule(style: .circular)
                        .stroke(Color(.white), lineWidth: 1)
                )
            
            HStack(spacing: 0) {
                
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal)
                
                ZStack {
                    
                    HStack {
                        
                        Text("Enter search keywords here")
                            .font(.custom("FuturaBT-Light", size: 16))
                            .foregroundColor(.white.opacity(0.8))
                            .opacity(self.searchBarIsEditing ? 0 : 1)
                        
                        Spacer(minLength: 1)
                    }
                    
                    HStack {
                        
                        TextField("", text: self.$searchText) { isEditing in
                            
                            if isEditing {
                                
                                self.searchBarIsEditing = true
                            }
                            
                            else {
                                
                                self.searchBarIsEditing = false
                            }
                        }
                        .font(.custom("FuturaBT-Light", size: 16))
                        .foregroundColor(.white.opacity(0.8))
                        
                        Spacer(minLength: 1)
                    }
                }
                
                Spacer(minLength: 1)
            }
        }
        .frame(height: 48)
    }
}

#Preview {
    HomeView()
}
