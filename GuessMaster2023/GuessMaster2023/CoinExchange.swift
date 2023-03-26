//
//  CoinExchange.swift
//  iOS-Assignment-2
//
//  Created by Shally Sharma on 2023-03-20.
//

import SwiftUI

struct CoinExchange: View {
    
    @State var isActive: Bool
    
    var body: some View {
        VStack {
            Text("Coin Exchange")
                .foregroundColor(.white)
                .font(.system(size: 44, weight: .bold))
                .padding(.top,50)
            HStack {
                Text("Points: ")
                    .font(.system(size: 44, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.top,50)

                Text("999")
                    .font(.system(size: 44, weight: .black))
                    .foregroundColor(Color.green)
                    .padding(.top,50)

            }.padding()
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
                
                Grid {
                    
                    NavigationLink {
                        BombaySpices()
                    } label: {
                        VStack {
                           
                            Image("bombay-spices")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                            Text("Bombay Spices")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(Color.white)
                                .padding()
                        }
                    }.listRowBackground(Color.black)
                }
                .padding()

            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct CoinExchange_Previews: PreviewProvider {
    static var previews: some View {
        CoinExchange(isActive: true)
    }
}
