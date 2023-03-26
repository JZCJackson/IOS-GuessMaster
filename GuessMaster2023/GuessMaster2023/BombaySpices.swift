//
//  BombaySpices.swift
//  iOS-Assignment-2
//
//  Created by Fenil Bhanavadiya on 2023-03-23.
//

import SwiftUI

struct BombaySpices: View {
    var body: some View {
        VStack {
            
            Text("Bombay Spices")
                .foregroundColor(.white)
                .font(.system(size: 44, weight: .bold))
                .padding(.top, 50)
            
            ZStack {
                Spacer()
//                Color.black.edgesIgnoringSafeArea(.all)
        
            
                Grid {
                    NavigationLink {
                        DiscountCode()
                    } label: {
                        HStack{
                            Text("Cheese (5% off)")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(Color.black)
                            Spacer()
                            Text("130 Points")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(Color.black)
                        }
                    }
                    .frame(height: 50)
                    .padding()
                    .background(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0))
                    .cornerRadius(8)
                    
                    NavigationLink {
                        DiscountCode()
                    } label: {
                        HStack{
                            Text("Vegetables (5% off)")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(Color.black)
                            Spacer()
                            Text("130 Points")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(Color.black)
                        }
                    }
                    .frame(height: 50)
                    .padding()
                    .background(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0))
                    .cornerRadius(8)
                    
                    NavigationLink {
                        DiscountCode()
                    } label: {
                        HStack{
                            Text("Snacks (5% off)")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(Color.black)
                            Spacer()
                            Text("130 Points")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(Color.black)
                        }
                    }
                    .frame(height: 50)
                    .padding()
                    .background(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0))
                    .cornerRadius(8)
                    
                    //            }
                    //            .navigationTitle("Bombay Spices")
                }
            }
        }
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
        
}

struct BombaySpices_Previews: PreviewProvider {
    static var previews: some View {
        BombaySpices()
    }
}
