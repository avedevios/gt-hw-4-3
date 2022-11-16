//
//  InfoModel.swift
//  lesson3412
//
//  Created by ake11a on 2022-11-05.
//

import Foundation

class InfoModel {
    
    private var controller: InfoController?
    
    var data: [Data] = []
    
    init(controller: InfoController) {
        self.controller = controller
    }
    
    func authControl(userInfo: (String, Int)) -> Bool {
      
        for user in data {
            if user.userName == userInfo.0 && user.age == userInfo.1 {
                return true
            }
        }
        let newValue = Data(userName: userInfo.0, age: userInfo.1)
        data.append(newValue)
        
        return false
    }
}

struct Data {
    var userName: String
    var age: Int
}
