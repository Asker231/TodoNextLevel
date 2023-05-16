//
//  DeletePostViewModel.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import SwiftUI
import Firebase

class DeletePostViewModel:ObservableObject{
    var readVM = ReadPostViewModel()
    
    func deleteWithID(id:PostModel){
        let db = Firestore.firestore()
        DispatchQueue.main.async {
            
            db.collection("Todos").document(id.id).delete{ err in
                if err == nil{
                    self.readVM.arrayPost.removeAll { el in
                        return el.id == id.id
                    }
                }
            }
        }
    }
}
