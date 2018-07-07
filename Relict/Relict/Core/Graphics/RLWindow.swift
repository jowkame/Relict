//
//  RLWindow.swift
//  Relict
//
//  Created by jowkame on 7/6/18.
//  Copyright © 2018 jowkame. All rights reserved.
//

import Foundation

struct RLWindowConfig {
    var x: Int = 0
    var y: Int = 0
    var width: Int = Constants.Window.defaultWidth
    var height: Int = Constants.Window.defaultHeight
    var title: String = Constants.Window.defaultTitle
}

class RLWindow {
    private var config: RLWindowConfig! = nil
    
    public var sdlWindowPointer: OpaquePointer?

    init(config: RLWindowConfig) {
        self.config = config
        
        sdlWindowPointer = SDL_CreateWindow(config.title, 100, 100, Int32(self.config.width), Int32(self.config.height), SDL_WINDOW_SHOWN.rawValue)
        
        SDL_Delay(10000)  // Pause execution for 3000 milliseconds, for example
        
        // Close and destroy the window
        SDL_DestroyWindow(sdlWindowPointer)
        
        // Clean up
        SDL_Quit()
    }
}
