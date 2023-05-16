//
//  AddPostView.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import SwiftUI

struct AddPostView: View {
    @StateObject var readVm   = ReadPostViewModel()
    @EnvironmentObject var postVM:AddPostViewModel
    @State             var title : String = ""
    @State             var text  : String = ""
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Add Task")
                .foregroundColor(.gray)
                .font(.system(size: 30))
                .bold()
            TextField("Title....", text: $title)
                .textFieldStyle(.roundedBorder)
                .font(.system(size: 20))
            ZStack(alignment: .bottom){
                TextEditor(text: $text)
                    .frame(height: 250)
                    .border(Color("texteditor"),width:1)
                    .cornerRadius(5)
                    
                HStack{
                    Spacer()
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 30,height: 28)
                        .foregroundColor(.cyan)
                }
                .padding()
            }
            ZStack{
                Button {
                    if self.title.isEmpty && self.text.isEmpty{
                        return
                    }else{
                        postVM.addPostDB(title: self.title, text: self.text)
                    }
                    self.title = ""
                    self.text = ""
                    
                } label: {
                    Text("AddPost")
                }
                .frame(maxWidth:.infinity)
                .padding(.horizontal,5)
                .padding(.vertical,9)
                .background(
                    title.isEmpty || text.isEmpty ?
                        Color("btncolor")
                    :
                        Color("activebtn")
                )
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
                .cornerRadius(5)
                
            }
            .padding()
            Spacer()
        }
        .padding(8)
        
 //MARK: - end view
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
