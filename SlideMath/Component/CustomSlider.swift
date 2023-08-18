//
//  MyCustomSlide.swift
//  Test
//
//  Created by Agfid Prasetyo on 11/04/23.
//

import SwiftUI

enum Hint {
    case top
    case bottom
}

struct CustomSlider: View {
    @State private var location: CGPoint = CGPoint(x: 50, y: (-6 / 100 ) * 300)
    @Binding var value: Double
    @Binding var hint: Hint?
    var range: (Double, Double)
    
    init(value: Binding<Double>, range: (Double, Double), hint: Binding<Hint?>) {
        _value = value
        self.range = range
        _hint = hint
    }
    
    struct NumberList: Identifiable {
        let id = UUID()
        var number: String
    }
    
    var numberList = [
        NumberList(number: "0"),
        NumberList(number: "-10"),
        NumberList(number: "-20"),
        NumberList(number: "-30"),
        NumberList(number: "-40"),
        NumberList(number: "-50"),
        NumberList(number: "-60"),
        NumberList(number: "-70"),
        NumberList(number: "-80"),
        NumberList(number: "-90")
    ]
    
    private func onDragChange(_ drag: DragGesture.Value, _ frame: CGRect) {
        let tapticFeedback = UINotificationFeedbackGenerator()
        var tmpLocationY = CGPoint(x: 0, y: 0)
    
        if drag.location.y <= 30 {
            tmpLocationY.y = location.y
            location.y = (-6 / 100 ) * 300
            value = 0
        } else if drag.location.y <= 60 {
            tmpLocationY.y = location.y
            location.y = (5 / 100) * 300
            value = -10
        } else if drag.location.y <= 90 {
            tmpLocationY.y = location.y
            location.y = (15 / 100 ) * 300
            value = -20
        } else if drag.location.y <= 120 {
            tmpLocationY.y = location.y
            location.y = (24 / 100 ) * 300
            value = -30
        } else if drag.location.y <= 150 {
            tmpLocationY.y = location.y
            location.y = (34 / 100 ) * 300
            value = -40
        } else if drag.location.y <= 180 {
            tmpLocationY.y = location.y
            location.y = (44 / 100 ) * 300
            value = -50
        } else if drag.location.y <= 210 {
            tmpLocationY.y = location.y
            location.y = (54 / 100 ) * 300
            value = -60
        } else if drag.location.y <= 240 {
            tmpLocationY.y = location.y
            location.y = (64 / 100 ) * 300
            value = -70
        } else if drag.location.y <= 270 {
            tmpLocationY.y = location.y
            location.y = (74 / 100 ) * 300
            value = -80
        } else if drag.location.y <= 300 {
            tmpLocationY.y = location.y
            location.y = (85 / 100 ) * 300
            value = -90
        } else if drag.location.y >= 300 {
            tmpLocationY.y = location.y
            location.y = (85 / 100 ) * 300
            value = -90
        }
        if location.y != tmpLocationY.y {
            tapticFeedback.notificationOccurred(.success)
        }
    }
    
    private func view(geometry: GeometryProxy) -> some View {
        let frame = geometry.frame(in: .global)
        let drag = DragGesture(minimumDistance: 0).onChanged { drag in
            onDragChange(drag, frame)
        }
        
        return VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                ZStack {
                    VStack {
                        Spacer()
                        Spacer()
                        Image("submarine")
                            .padding([.bottom, .trailing], 25.0)
                            .offset(x: /*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/, y: location.y)
                            .animation(.easeIn, value: location)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                }
                ZStack {
                    ZStack(alignment: hint == .top ? .top : .bottom) {
                        ZStack(alignment: .center) {
                            Group {
                                Rectangle()
                                    .frame(width: 60.0, height: 330)
                                    .cornerRadius(30.0)
                                    .foregroundColor(Color("button_disabled"))
                                Group {
                                    Rectangle()
                                        .frame(width: 45, height: 300)
                                        .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color.white)
                                    VStack(spacing: 10, content: {
                                        ForEach(numberList) { list in
                                            Text(list.number)
                                                .font(.body)
                                                .fontWeight(.heavy)
                                                .foregroundColor(Color("green_text"))
                                        }.fixedSize(horizontal: false, vertical: true)
                                    })
                                }.gesture(drag)
                            }
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                        
                        // hint
                        if hint != nil {
                            Rectangle()
                                .frame(width: 60.0, height: 350 / 2)
                                .foregroundColor(Color.hint)
                                .cornerRadius(
                                    30,
                                    corners: hint == .top ? [.topLeft, .topRight] : [.bottomLeft, .bottomRight]
                                )
                                .gesture(drag)
                                .padding()
                        }
                    }
                    VStack {
                        Spacer()
                        Spacer()
                        Image("knob_slider")
                            .padding(.trailing, 75.0)
                            .offset(x: /*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/, y: location.y)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            }
            .padding(.top, 150)
            Spacer()
        }
    }
    
    var body: some View {
        return GeometryReader { geometry in
            self.view(geometry: geometry)
        }
    }
}
