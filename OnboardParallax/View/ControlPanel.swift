//
//  ControlPanel.swift
//  OnboardParallax
//
//  Created by Валерий Игнатьев on 23.05.23.
//

import SwiftUI

//MARK: - ControlPanel

struct ControlPanel: View {

    //MARK: Properties
    
    @Binding var number: Int
    
    //MARK: Body

    var body: some View {
        Picker("", selection: $number) {
            Text("1").tag(1)
            Text("2").tag(2)
            Text("3").tag(3)
            Text("4").tag(4)
            Text("5").tag(5)
        }
        .pickerStyle(.segmented)
        .padding()
    }
}


//MARK: - PreviewProvider

struct ControlPanel_Previews: PreviewProvider {
    static var previews: some View {
        ControlPanel(number: .constant(2))
    }
}
