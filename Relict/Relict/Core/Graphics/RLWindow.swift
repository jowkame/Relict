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
    private var isRunning: Bool = true
    
    public var sdlWindowPointer: OpaquePointer?

    init(config: RLWindowConfig) {
        self.config = config
    }
    
    func show() {
        let x = config.isCentered ? Int32(SDL_WINDOWPOS_CENTERED_MASK) : Int32(config.x)
        let y = config.isCentered ? Int32(SDL_WINDOWPOS_CENTERED_MASK) : Int32(config.y)
        
        sdlWindowPointer = SDL_CreateWindow(config.title, x, y, Int32(config.width), Int32(config.height), SDL_WINDOW_SHOWN.rawValue)
        
        
        while (isRunning) {
            let event = UnsafeMutablePointer<SDL_Event>.allocate(capacity: 1)
            
            event.withMemoryRebound(to: SDL_Event.self, capacity: 1) {
                if SDL_PollEvent($0) != 0 {
                    if event.pointee.type == SDL_KEYDOWN.rawValue {
                        if event.pointee.key.keysym.sym == SDLK_ESCAPE {
                            isRunning = false
                        }
                    }
                } else {
                    isRunning = false
                }
            }
        }
        
        SDL_DestroyWindow(sdlWindowPointer)
        SDL_Quit()
    }
}
