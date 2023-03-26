//
//  MainAppView.swift
//  Ios1Project
//
//  Created by Orange on 2023-03-17.
//

import SwiftUI

struct MainAppView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor.gray
        }
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            GuessView()
                .tabItem {
                    Label("Guess", systemImage: "questionmark.circle")
                }
            RankView()
                .tabItem {
                    Label("Rank", systemImage: "star")
                }
            FriendsList()
                .tabItem {
                    Label("Friends", systemImage: "person.3")
                }
            CoinExchange(isActive: true)
                .tabItem {
                    Label("Coin Exchange", systemImage: "coloncurrencysign.circle")
                }
        }.accentColor(.white)
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
