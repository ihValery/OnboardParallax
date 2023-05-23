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
            OneLayerView(nameLayer: "sky", numberLayer: 1, numberStr: numberStr)

            OneLayerView(nameLayer: "rocks_3", numberLayer: 2, numberStr: numberStr)

            OneLayerView(nameLayer: "rocks_2", numberLayer: 3, numberStr: numberStr)

            OneLayerView(nameLayer: "rocks_1", numberLayer: 4, numberStr: numberStr)

            OneLayerView(nameLayer: "clouds_1", numberLayer: 2, numberStr: numberStr)

            OneLayerView(nameLayer: "clouds_2", numberLayer: 3, numberStr: numberStr)

            OneLayerView(nameLayer: "birds", numberLayer: 4, numberStr: numberStr)
                .offset(x: 80)
            
            OneLayerView(nameLayer: "pines", numberLayer: 5, numberStr: numberStr)
        }
    }
}

//MARK: - PreviewProvider

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView(numberStr: .constant(1))
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
        case 5: return 210
        default: return 1
        }
    }
}
