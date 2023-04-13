//
//  MyCustomSlide.swift
//  Test
//
//  Created by Agfid Prasetyo on 11/04/23.
//

import SwiftUI

struct CustomSlider: View {
    @State var location: CGPoint = CGPoint(x: 50, y: 40)
    @Binding var value: Double
    var range: (Double, Double)
    
    init(value: Binding<Double>, range: (Double, Double)) {
        _value = value
        self.range = range
    }
    
    struct NumberList: Identifiable {
        let id = UUID()
        var no: String
    }
    
    var numberList = [
        NumberList(no: "0"),
        NumberList(no: "-10"),
        NumberList(no: "-20"),
        NumberList(no: "-30"),
        NumberList(no: "-40"),
        NumberList(no: "-50"),
        NumberList(no: "-60"),
        NumberList(no: "-70"),
        NumberList(no: "-80"),
        NumberList(no: "-90")
    ]
    
    private func onDragChange(_ drag: DragGesture.Value,_ frame: CGRect) {
        let tapticFeedback = UINotificationFeedbackGenerator()
        var tmpLocationY = CGPoint(x: 0, y: 0)
        
        if (drag.location.y - 165 <= -120) {
            tmpLocationY.y = location.y
            location.y = 40
            value = 0
        } else if (drag.location.y - 165 <= -90) {
            tmpLocationY.y = location.y
            location.y = 70
            value = -10
        } else if (drag.location.y - 165 <= -60) {
            tmpLocationY.y = location.y
            location.y = 100
            value = -20
        } else if (drag.location.y - 165 <= -30) {
            tmpLocationY.y = location.y
            location.y = 125
            value = -30
        } else if (drag.location.y - 165 <= 0) {
            tmpLocationY.y = location.y
            location.y = 153
            value = -40
        } else if (drag.location.y - 165 <= 30) {
            tmpLocationY.y = location.y
            location.y = 180
            value = -50
        } else if (drag.location.y - 165 <= 60) {
            tmpLocationY.y = location.y
            location.y = 205
            value = -60
        } else if (drag.location.y - 165 <= 90) {
            tmpLocationY.y = location.y
            location.y = 235
            value = -70
        } else if (drag.location.y - 165 <= 120) {
            tmpLocationY.y = location.y
            location.y = 260
            value = -80
        } else if (drag.location.y - 165 <= 150) {
            tmpLocationY.y = location.y
            location.y = 290
            value = -90
        } else if (drag.location.y >= 310) {
            tmpLocationY.y = location.y
            location.y = 290
            value = -90
        }
        if (location.y != tmpLocationY.y) {
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
            HStack(alignment: .center) {
                Spacer()
                ZStack {
                    Image("submarine")
                        .padding([.bottom, .trailing], 25.0)
                        .offset(x: /*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/, y: location.y-165)
                }
                ZStack {
                    Group {
                        Rectangle()
                            .frame(width: 60.0, height: 350)
                            .cornerRadius(30.0)
                            .foregroundColor(Color("button_disabled"))
                        Group {
                            Rectangle()
                                .frame(width: 45, height: 300)
                                .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.white)
                            VStack(spacing: 10, content: {
                                ForEach(numberList) { list in
                                    Text(list.no)
                                        .font(.body)
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color("green_text"))
                                }
                            })
                        }.gesture(drag)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Image("knob_slider")
                        .padding(.trailing, 75.0)
                        .offset(x: /*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/, y: location.y-165)
                }
            }
            .padding(.top, 150)
            Spacer()
        };
    }
    
    var body: some View {
        return GeometryReader { geometry in
            self.view(geometry: geometry)
        }
    }
}

//struct CustomSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSlider(value: Binding<Double(0)>, range: (0, 100))
//    }
//}
