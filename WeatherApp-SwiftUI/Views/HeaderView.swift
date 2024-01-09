//
//  HeaderView.swift
//  WeatherApp-SwiftUI
//
//  Created by Gembali Sandesh Kumar on 07/01/24.
//

import SwiftUI

struct HeaderView: View {
    
    @ObservedObject var cityVM: WeatherViewModel
    
    @State private var searchTerm = "Chennai"

    var body: some View {

        HStack {
            
            TextField("", text: $searchTerm)
                .padding(.leading, 20)
            
            Button {
                
                cityVM.city = searchTerm
            } label : {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.brown)
                    
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading) {
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black.opacity(0.5))
        })
    }
}

