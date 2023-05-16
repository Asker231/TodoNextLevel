//
//  ContentView.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var postVM = AddPostViewModel()
    var body: some View {
        ZStack{
            TabBarView()
                .environmentObject(postVM)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
