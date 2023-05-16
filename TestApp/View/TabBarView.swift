//
//  TabBarView.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var postVM:AddPostViewModel
    
    @State var isAdd = false
    @State var selected = 1
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack(alignment: .bottom){
//MARK: - TabViewSection
                TabView(selection: $selected){
                          ListView()
                             .tag(1)
                          SettingView()
                              .tag(2)
                      }
//MARK: - start HSTACK
                HStack{
                    
                    Spacer()
                    Button {
                        withAnimation {
                            selected = 1
                        }
                    } label: {
                        Image(systemName: "list.bullet.rectangle")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(selected == 1 ? .cyan :.gray)
                            
                    }
                    Spacer()
                    Button {
                        self.isAdd.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(.gray)
                            
                    }.sheet(isPresented: $isAdd) {
                        AddPostView()
                            .environmentObject(postVM)
                    }
                    Spacer()
                    Button {
                        withAnimation {
                            selected = 2
                        }
                    } label: {
                        Image(systemName: "gear.badge")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(selected == 2 ? .cyan : .gray)
                            
                    }
                    Spacer()

                }
                .padding(.vertical,20)
                .foregroundStyle(LinearGradient(colors: [.cyan,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                .background(.ultraThinMaterial,in : RoundedRectangle(cornerRadius: 10,style: .continuous))
            
//MARK: - end HSTACK
        }.edgesIgnoringSafeArea(.all)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
