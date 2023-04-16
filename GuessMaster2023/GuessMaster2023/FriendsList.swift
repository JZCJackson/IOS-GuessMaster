//
//  FriendsList.swift
//  iOS-Assignment-2
//
//  Created by Shally Sharma on 2023-03-20.
//

import SwiftUI

struct FriendsList: View {
    var body: some View {
        VStack {
            
            Text("FriendList")
                .foregroundColor(.white)
                .font(.system(size: 44, weight: .bold))
                .padding(.top, 50)
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                Grid{
                    Text("Shally Sharma")
                        .listRowBackground(Color.black)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .frame(height: 52)
                        .font(.system(size: 21))
                        .padding(.top, 50)
                   
                    Text("Fenilkumar Bhanavadiya")
                        .listRowBackground(Color.black)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .frame(height: 52)
                        .font(.system(size: 21))
                        .padding(.top, 30)
                    
                    Text("Junzhi Chen")
                        .listRowBackground(Color.black)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .frame(height: 52)
                        .font(.system(size: 21))
                        .padding(.top, 30)
                    
                    Text("Sujitha Bayya")
                        .listRowBackground(Color.black)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .frame(height: 52)
                        .font(.system(size: 21))
                        .padding(.top, 30)
                    
                    Text("Player5")
                        .listRowBackground(Color.black)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .frame(height: 52)
                        .font(.system(size: 21))
                        .padding(.top, 30)
 
                }
                .padding()
                .background(Color.green)
                .cornerRadius(8)
                }
        }
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
