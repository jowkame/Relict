//
//  RLGraphicsManager.swift
//  Relict
//
//  Created by jowkame on 7/6/18.
//  Copyright © 2018 jowkame. All rights reserved.
//

import Foundation

struct RLGraphicsManagerResult {
    var isSuccess: Bool = false
    var error: RLError! = nil
}

class RLGraphicsManager {
    var window: RLWindow! = nil
    
    func initVideo() -> RLGraphicsManagerResult {
        let result = SDL_Init(SDL_INIT_VIDEO)
        
        if result < 0 {
            return RLGraphicsManagerResult(isSuccess: false, error: RLError.procInitError())
        }
        return RLGraphicsManagerResult(isSuccess: true, error: nil)
    }
    
    func createWindow() {
        let config = RLWindowConfig(x: 0, y: 0, isCentered: true, width: 800, height: 600, title: "Demo Relict App")
        window = RLWindow(config: config)
        window.show()
    }
}
