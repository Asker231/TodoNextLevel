//
//  AddPostViewModel.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import SwiftUI
import Firebase

class AddPostViewModel:ObservableObject{
@StateObject var readVm = ReadPostViewModel()
    func addPostDB(title:String,text:String){
        let db = Firestore.firestore()
        DispatchQueue.main.async {
            db.collection("Todos").addDocument(data: ["title":title,"text":text]){ err in
                if err == nil{
                    self.readVm.getDB()
                }else{
                  ///
                }
            }
        }
    }
}
