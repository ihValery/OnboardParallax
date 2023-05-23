//
//  PictureView.swift
//  OnboardParallax
//
//  Created by Валерий Игнатьев on 23.05.23.
//

import SwiftUI

//MARK: - PictureView

struct PictureView: View {
    var body: some View {
        Image("BackgroundImage")
            .resizable()
            .scaledToFill()
    }
}

//MARK: - PreviewProvider

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView()
    }
}
