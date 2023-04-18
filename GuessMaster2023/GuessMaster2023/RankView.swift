//
//  RankView.swift
//  GuessMaster2023
//
//  Created by Junzhi Chen on 2023-03-22.
//

import SwiftUI

struct RankView: View {
    @State private var users: [User] = []

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Rank")
                    .padding()
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top,50)

                GridView(items: users) { user in
                    VStack {
                        Text(user.charName)
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .frame(height: UIScreen.main.bounds.height * 0.0065)
                        
                        Text("\(user.points)")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold))
                    }
                    .padding()
                    .background(Color(red: 187.0/255.0, green: 134/255.0, blue: 252/255.0))
                    .cornerRadius(8)
                }
                .padding()
                .onAppear {
                    loadUsers()
                }
            }
        }
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }

    private func loadUsers() {
        // Add sample data for testing or fetch data from a database
        let user1 = User(charName: "Character1", name: "John Doe", email: "john.doe@example.com", phone: "123-456-7890", points: 100)
        let user2 = User(charName: "Character2", name: "Jane Doe", email: "jane.doe@example.com", phone: "123-456-7891", points: 200)
        let user3 = User(charName: "Character3", name: "John Smith", email: "john.smith@example.com", phone: "123-456-7892", points: 300)

        self.users = [user1, user2, user3]
    }
    }

    struct RankView_Previews: PreviewProvider {
    static var previews: some View {
    RankView()
    }
    }
