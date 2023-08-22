//
//  ExplanationView.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 19/04/23.
//

import SwiftUI
import AVKit

struct ExplanationView: View {
    var fileName: String?
    
    var body: some View {
        VStack {
            Text("Penjelasan🤯")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(Color("blue_text"))
                .padding()
            
            VideoPlayer(
                player: AVPlayer(url: Bundle.main.url(forResource: fileName ?? "answer1", withExtension: "mov")!)
            )
            .frame(height: UIScreen.main.bounds.height * 65 / 100)
            .cornerRadius(24, corners: .allCorners)
        }
        .padding()
    }
}

struct ExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationView(fileName: "answer1")
    }
}
