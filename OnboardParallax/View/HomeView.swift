//
//  HomeView.swift
//  OnboardParallax
//
//  Created by Валерий Игнатьев on 23.05.23.
//

import SwiftUI

//MARK: - HomeView

struct HomeView: View {

    //MARK: Properties
    
    @State private var number: Int = 1
    
    //MARK: Body

    var body: some View {
        PictureView(numberStr: $number)
            .overlay(alignment: .bottom) {
                ControlPanel(number: $number)
            }
            .ignoresSafeArea()
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
