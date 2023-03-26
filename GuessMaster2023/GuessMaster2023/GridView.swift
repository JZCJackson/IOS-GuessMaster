//
//  GridView.swift
//  GuessMaster2023
//
//  Created by Orange on 2023-03-23.
//

import SwiftUI

struct GridView<Content: View>: View {
    let items: [User]
    let content: (User) -> Content

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 1), spacing: 20, content: {
                ForEach(items, id: \.email) { item in
                    content(item)
                }
            })
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(items: [
            User(charName: "Character1", name: "John Doe", email: "john.doe@example.com", phone: "123-456-7890", points: 100),
//            User(charName: "Character2", name: "Jane Doe", email: "jane.doe@example.com", phone: "123-456-7891", points: 200),
//            User(charName: "Character3", name: "John Smith", email: "john.smith@example.com", phone: "123-456-7892", points: 300)
        ]) { user in
            Text(user.charName)
        }
    }
}
