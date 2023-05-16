//
//  ReadPostViewModel.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import SwiftUI
import Firebase


class ReadPostViewModel:ObservableObject{
    @Published var arrayPost : [PostModel] = []
    @Published var error     : String = ""
    func getDB(){
        let dataBase = Firestore.firestore()
        dataBase.collection("Todos").getDocuments { value, error in
            if let error = error {
                self.error = error.localizedDescription
            }
            if let value = value {
                DispatchQueue.main.async {
                    self.arrayPost = value.documents.map({ el in
                        return PostModel(id: el.documentID, title: el["title"] as? String ?? "", text: el["text"] as? String ?? "")
                    })
                }
            }
        }
    }
    
}
