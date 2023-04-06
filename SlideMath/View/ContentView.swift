//
//  ContentView.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 03/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var greeting = "hello"
    
    var body: some View {
        VStack {
            Text(greeting)
            
            Button("change greeting") {
                greeting = "aloha"
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
