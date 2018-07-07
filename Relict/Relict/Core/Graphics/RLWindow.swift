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
    var isCentered: Bool = true
    var width: Int = Constants.Window.defaultWidth
    var height: Int = Constants.Window.defaultHeight
    var title: String = Constants.Window.defaultTitle
}

class RLWindow {
    private var config: RLWindowConfig! = nil
    
    public var sdlWindowPointer: OpaquePointer?

    init(config: RLWindowConfig) {
        self.config = config
    }
    
    func show() {
        let x = config.isCentered ? Int32(SDL_WINDOWPOS_CENTERED_MASK) : Int32(config.x)
        let y = config.isCentered ? Int32(SDL_WINDOWPOS_CENTERED_MASK) : Int32(config.y)
        
        sdlWindowPointer = SDL_CreateWindow(config.title, x, y, Int32(config.width), Int32(config.height), SDL_WINDOW_SHOWN.rawValue)
        
        while (true) {
            let event: UnsafeMutablePointer<SDL_Event>! = nil
            
            while (SDL_PollEvent(event) != 0) {
                /* handle your event here */
            }
            /* do some other stuff here -- draw your app, etc. */
        }
        
        // Close and destroy the window
        SDL_DestroyWindow(sdlWindowPointer)
        
        // Clean up
        SDL_Quit()
    }
}
