//
//  DiscountCode.swift
//  iOS-Assignment-2
//
//  Created by Fenil Bhanavadiya on 2023-03-23.
//

import SwiftUI

struct DiscountCode: View {
    
    @State private var showAlert = false
    @StateObject private var userData = UserData()
    @State private var code = ""
    
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
                    
                    if let user = userData.user.first {
                        if user.points > 130 {
                            decresePoints()
                            code = String(Int.random(in: 0..<999999999))
                        } else {
                            showAlert.toggle()
                        }
                    }
                    
                } label: {
                    Text("Show Code")
                        .foregroundColor(Color.yellow)
                        .font(.system(size: 21, weight: .bold, design: .rounded))
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Oops :("), message: Text("Sorry, but you don't have enough points"), dismissButton: .default(Text("Done")))
                }

                Text("\(code)")
                    .foregroundColor(Color.yellow)
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                
                Spacer()
            }
        }
    }
    
    func decresePoints() {
        if let currentUser = userData.user.first {
            let newPoints = currentUser.points - 130
            userData.updatePoints(newPoints: newPoints)
        }
    }
    
}

struct DiscountCode_Previews: PreviewProvider {
    static var previews: some View {
        DiscountCode()
    }
}
