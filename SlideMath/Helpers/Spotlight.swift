//
//  Spotlight.swift
//  SlideMath
//
//  Created by mora hakim on 11/04/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func addSpotlight(_ id: Int, shape: SpotLightShape = .rectangle, roundedRadius: CGFloat = 0, text: String = "", position: Position) -> some View {
        self.anchorPreference(key: BoundsKey.self, value: .bounds) {[id: BoundsKeyProperties(shape: shape, anchor: $0, text: text, radius: roundedRadius)]}
        if position == .top {
            
        }
    }
    
    //MARK: Modifier to Displaying Spotlight Content
    //NOTE: Add to root view
    
    @ViewBuilder
    func addSpotLightOverlay(show: Binding<Bool>, currentSpot: Binding<Int>, position: Position) -> some View {
        self.overlayPreferenceValue(BoundsKey.self) { values in
            GeometryReader{ proxy in
                
                
                if let preference = values.first(where: { item in
                    item.key == currentSpot.wrappedValue
                }){
                    let screenSize = proxy.size
                    let anchor = proxy[preference.value.anchor]
                    
                    //MARK: Spotlight View
                    SpotLightHelperView(screenSize: screenSize, rect: anchor, show: show, currentSpot: currentSpot, properties: preference.value, position: position){
                        if currentSpot.wrappedValue <= (values.count) {
                            currentSpot.wrappedValue += 1
                        }else {
                            show.wrappedValue = false
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .animation(.easeInOut,value: show.wrappedValue)
            .animation(.easeInOut, value: currentSpot.wrappedValue)
        }
    }
    
    //MARK: Helper View
    @ViewBuilder
    func SpotLightHelperView(screenSize: CGSize, rect: CGRect, show: Binding<Bool>, currentSpot: Binding<Int>, properties: BoundsKeyProperties, position: Position, onTap: @escaping()->()) -> some View {
        Rectangle()
            .fill(.ultraThinMaterial)
            .environment(\.colorScheme, .dark)
            .opacity(show.wrappedValue ? 1 : 0)
        
            .overlay(content: {
                
                Text(properties.text)
                    .font(.title2)
                    .foregroundColor(.white)
                    .position(x: rect.minX + 40, y: rect.minY + 65)
                
                //                switch position {
                //                case .bottom:
                //                    Text(properties.text)
                //                        .font(.title2)
                //                        .foregroundColor(.white)
                //                        .position(x: rect.minX + 40, y: rect.minY + 50)
                //                default:
                //                    Text(properties.text)
                //                        .font(.title2)
                //                        .foregroundColor(.white)
                //                        .position(x: rect.minX + 40, y: rect.minY + 50)
                //                }
            })
            .mask {
                Rectangle()
                    .overlay(alignment: .topLeading) {
                        let radius = properties.shape == .circle ? (rect.width / 2) : (properties.shape == .rectangle ? 0 : properties.radius)
                        RoundedRectangle(cornerRadius: radius, style: .continuous)
                            .frame(width: rect.width, height: rect.height)
                            .offset(x: rect.minX, y: rect.minY)
                            .blendMode(.destinationOut)
                    }
            }
            .onTapGesture {
                onTap()
            }
    }
    
}

// MARK: Spotlight shape
enum SpotLightShape {
    case circle
    case rectangle
    case rounded
}

//MARK: Bounds Preference Key
struct BoundsKey: PreferenceKey {
    static var defaultValue: [Int: BoundsKeyProperties] = [:]
    
    static func reduce(value: inout [Int: BoundsKeyProperties], nextValue: () -> [Int: BoundsKeyProperties]) {
        value.merge(nextValue()){$1}
    }
}

//MARK: Bounds Preference Key Properties
struct BoundsKeyProperties {
    var shape: SpotLightShape
    var anchor: Anchor<CGRect>
    var text: String
    var radius: CGFloat = 0
}

//struct Spotlight_Previews: PreviewProvider {
//
//var previews: some View {
//        QuestionView()
//    }
//}
