//
//  DiscountCode.swift
//  iOS-Assignment-2
//
//  Created by Fenil Bhanavadiya on 2023-03-23.
//

import SwiftUI

struct DiscountCode: View {
    var body: some View {
        ZStack{
            
            Color.black.ignoresSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                Text("Plaese take a screenshot of code")
                    .foregroundColor(Color.white)
                    .font(.system(size: 21))
                Image("bombay-spices")
                
                Spacer()
                
                Button {
                    print("here is the code")
                } label: {
                    Text("Show Code")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 21, weight: .bold, design: .rounded))
                }
                .padding()

                Text("CODE")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                
                Spacer()
            }
        }
    }
}

struct DiscountCode_Previews: PreviewProvider {
    static var previews: some View {
        DiscountCode()
    }
}
