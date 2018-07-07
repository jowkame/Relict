//
//  Core.swift
//  Relict
//
//  Created by jowkame on 7/1/18.
//  Copyright © 2018 jowkame. All rights reserved.
//

import Foundation

public class RLApp {
    private var graphicsManager: RLGraphicsManager! = nil
    
    public init() {}
    
    public func run() {
        graphicsManager = RLGraphicsManager()
        let graphicsResult = graphicsManager.initVideo()
        
        if graphicsResult.error != nil {
            print("Error \(graphicsResult.error.code.rawValue)" + " - " + graphicsResult.error.message.rawValue)
        } else {
            graphicsManager.createWindow()
        }
    }
}
