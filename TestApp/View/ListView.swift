//
//  ListView.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import SwiftUI

struct ListView: View {
    @StateObject var readVm   = ReadPostViewModel()
    @StateObject var deleteVM = DeletePostViewModel()
    @State       var isreset = false
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    init(){
        UIView.appearance().backgroundColor = .clear
    }
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                LinearGradient(colors: [.cyan,.indigo,], startPoint: .topTrailing, endPoint: .bottomLeading)
                    .opacity(0.4)
                if readVm.arrayPost.isEmpty{
                    Text("Empty list...")
                        .foregroundColor(Color("texteditor"))
                        .font(.system(size: 24))
                        .bold()
                        .offset(y:140)
                }
           
                    List(readVm.arrayPost.reversed()) { el in
                        withAnimation(.spring()){
                            VStack(alignment: .leading){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("\(el.title)")
                                            .bold()
                                        Text("\(el.text)")
                                            .font(.system(size: 13))
                                    }
                                }
                            }.swipeActions {
                                Button {
                                    deleteVM.deleteWithID(id: el)
                                } label: {
                                    Image(systemName:"minus.circle.fill")
                                        .resizable()
                                        .frame(width: 28,height: 28)
                                        .foregroundColor(.red)
                                }.tint(.red)
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)

                .foregroundStyle(LinearGradient(colors: [.cyan,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(.vertical,40)
                HStack{
                    Spacer()
                    Button {
                        withAnimation(.spring()){
                            isreset.toggle()
                        }
                        readVm.getDB()
                    } label: {
                        Image(systemName:"arrow.clockwise.circle.fill")
                            .resizable()
                            .frame(width: 30,height: 30)
                    }.rotationEffect(.init(radians: isreset ? 30 : 0))

                }.padding(40)
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
       // .onReceive(timer, perform: { _ in
         //   readVm.getDB()
        //})
        .onAppear{
            readVm.getDB()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
