//
//  UserViewModel.swift
//  TestApp
//
//  Created by ASKER on 16.05.2023.
//

import Foundation
import FirebaseAuth

class UserViewModel:ObservableObject{
    @Published var userName  : String?

    
    
    func createUserDB(userEmail:String,userPass:String){
        Auth.auth().createUser(withEmail:userEmail, password: userPass){ res,err in
           // guard let res = res else {return}
            //guard let err = err else {return}
           // print(res.user.uid)
        }
    }
}
