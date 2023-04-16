//
//  ContentView.swift
//  GuessMaster2023
//
//  Created by Orange on 2023-03-18.
//
import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn: Bool = false
    @State private var showLaunchScreen: Bool = true

    var body: some View {
        NavigationView {
            if showLaunchScreen {
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                self.showLaunchScreen = false
                            }
                        }
                    }
            } else {
                if isLoggedIn {
                    MainAppView()
                } else {
                    VStack {
                        LoginView()
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
