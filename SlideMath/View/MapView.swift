//
//  MapView.swift
//  SlideMath
//
//  Created by Wahid Hidayat on 11/04/23.
//

import SwiftUI

struct MapView: View {
    var currentSoal: Int
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    Spacer()
                    ZStack(alignment: .topLeading) {
                        Image("background_map")
                            .resizable()
                            .frame(height: 80 / 100 * UIScreen.main.bounds.size.height)
                        
                        VStack {
                            HStack {
                                Button {
                                    // TODO: Navigate to soal 1
                                } label: {
                                    Image("first_fish")
                                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                                }
                                
                                Spacer()
                            }
                            
                            Image("first_bubble")
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    // TODO: Navigate to soal 2
                                } label: {
                                    Image(currentSoal < 2 ? "second_fish_locked" : "second_fish")
                                        .padding()
                                }
                                .disabled(currentSoal < 2)
                            }
                            
                            HStack {
                                Spacer()
                                Image("second_bubble")
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                            }
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    // TODO: Navigate to soal 3
                                } label: {
                                    Image(currentSoal < 3 ? "third_fish_locked" : "third_fish")
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                                }
                                .disabled(currentSoal < 3)
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                
                VStack {
                    Image("title_map")
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(currentSoal: 1)
    }
}
