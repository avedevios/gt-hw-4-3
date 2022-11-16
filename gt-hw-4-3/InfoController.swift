//
//  InfoController.swift
//  lesson3412
//
//  Created by ake11a on 2022-11-05.
//

import Foundation

class InfoController {
    private weak var view: ViewController?
    
    private var model: InfoModel!
    
    init(view: ViewController) {
        self.view = view
        self.model = InfoModel(controller: self)
    }
    
    func authControl(userInfo: (String, Int)) -> Bool {
       return  model.authControl(userInfo: userInfo)
    }
}
