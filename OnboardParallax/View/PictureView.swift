//
//  PictureView.swift
//  OnboardParallax
//
//  Created by Валерий Игнатьев on 23.05.23.
//

import SwiftUI

//MARK: - PictureView

struct PictureView: View {
    
    //MARK: Properties

    @Binding var numberStr: Int
    
    //MARK: Body

    var body: some View {
        GeometryReader { geoProxy in
        
            //MARK: - Layer One
            Group {
                OneLayerView(nameLayer: "sky", numberLayer: 1, numberStr: numberStr)
                
                TextLayerView(text: "Onboarding", numberLayer: 1, numberStr: numberStr)
                    .position(x: numberStr == 1 ? geoProxy.size.width / 2 + 110 : geoProxy.size.width / 2, y: geoProxy.size.height * 2 / 3 + 20)
                    .blur(radius: numberStr == 5 ? 50 : 0)
                    .opacity(numberStr == 5 ? 0 : 1)
            }
            
            //MARK: - Layer Two
            Group {
                OneLayerView(nameLayer: "rocks_3", numberLayer: 2, numberStr: numberStr)
                
                OneLayerView(nameLayer: "clouds_1", numberLayer: 2, numberStr: numberStr)
                                
            }

            //MARK: - Layer Three
            Group {
                OneLayerView(nameLayer: "rocks_2", numberLayer: 3, numberStr: numberStr)
                
                OneLayerView(nameLayer: "clouds_2", numberLayer: 3, numberStr: numberStr)
                
                TextLayerView(text: "wow", numberLayer: 2, numberStr: numberStr)
                    .position(x: geoProxy.size.width / 2 + 105, y: geoProxy.size.height * 2 / 3 - 45)
                    .offset(x: numberStr > 3 ? -400 : 0)
                    .offset(y: numberStr >= 3 ? 0 : -580)
                    .blur(radius: numberStr >= 3 ? 0 : 300)
                    .opacity(numberStr == 3 ? 1 : 0)
                
                TextLayerView(text: "EFFECT", numberLayer: 2, numberStr: numberStr)
                    .position(x: geoProxy.size.width / 2 + 60, y: geoProxy.size.height * 2 / 3 + 110)
                    .offset(x: numberStr == 5 ? 0 : 143)
                    .offset(x: numberStr < 4 ? 140 : 0)
                    .opacity(numberStr < 4 ? 0 : 1)
            }
            
            //MARK: - Layer Foure
            Group {
                OneLayerView(nameLayer: "rocks_1", numberLayer: 4, numberStr: numberStr)
                
                OneLayerView(nameLayer: "birds", numberLayer: 4, numberStr: numberStr)
                    .offset(x: 80)
                
                TextLayerView(text: "parallax", numberLayer: 2, numberStr: numberStr)
                    .position(x: geoProxy.size.width / 2 + 60, y: geoProxy.size.height * 2 / 3 + 85)
                    .offset(x: numberStr == 2 ? 0 : ( numberStr > 2 ? -380 : 300))
                    .opacity(numberStr != 2 ? 0 : 1)
            }

            //MARK: - Layer Five
            Group {
                OneLayerView(nameLayer: "pines", numberLayer: 5, numberStr: numberStr)
            }
        }
        .animation(Animation.interpolatingSpring(mass: 0.21, stiffness: 2.8, damping: 1.28, initialVelocity: 3.0), value: numberStr)
    }
}

//MARK: - PreviewProvider

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView(numberStr: .constant(4))
    }
}

//MARK: - OneLayerView

fileprivate struct OneLayerView: View {
    
    //MARK: Properties
    
    let nameLayer: String
    let numberLayer: Int
    let numberStr: Int

    //MARK: Body

    var body: some View {
        Image(nameLayer)
            .resizable()
            .scaledToFill()
            .offset(x: -CGFloat(numberStr * shiftByNumberLayer(number: numberLayer)))
            .animation(Animation.interpolatingSpring(mass: 0.21, stiffness: 2.8, damping: 1.28, initialVelocity: 3.0), value: numberStr)
    }
    
    //MARK: Private Methods
    
    private func shiftByNumberLayer(number: Int) -> Int {
        switch number {
        case 1: return 1
        case 2: return 10
        case 3: return 30
        case 4: return 150
        case 5: return 250
        default: return 1
        }
    }
}

//MARK: - OneLayerView

fileprivate struct TextLayerView: View {
    
    //MARK: Properties
    
    let text: String
    let numberLayer: Int
    let numberStr: Int

    //MARK: Body

    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.system(size: 70, weight: .regular, design: .serif))
    }
    
    //MARK: Private Methods
    
    private func shiftByNumberLayer(number: Int) -> Int {
        switch number {
        case 1: return 1
        case 2: return 10
        case 3: return 30
        case 4: return 150
        case 5: return 210
        default: return 1
        }
    }
}
