//
//  HomeView.swift
//  OnboardParallax
//
//  Created by Валерий Игнатьев on 23.05.23.
//

import SwiftUI

//MARK: - HomeView

struct HomeView: View {
    var body: some View {
        PictureView()
            .ignoresSafeArea()
    }
}

//MARK: - PreviewProvider

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
