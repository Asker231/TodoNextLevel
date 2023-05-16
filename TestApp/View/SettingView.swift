//
//  SettingView.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.cyan,.indigo,], startPoint: .topTrailing, endPoint: .bottomLeading)
                .opacity(0.4)
            Text("Setting")
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
