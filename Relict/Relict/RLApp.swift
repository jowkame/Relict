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
    private var configManager: RLConfigManager! = nil
    
    public init() {}
    
    public func run() {
        configManager = RLConfigManager()
        configManager.processConfigFile()
        
        graphicsManager = RLGraphicsManager()
        let graphicsResult = graphicsManager.initVideo()
        
        if graphicsResult.error != nil {
            print("Error \(graphicsResult.error.code.rawValue)" + " - " + graphicsResult.error.message.rawValue)
        } else {
            graphicsManager.createWindow()
        }
    }
}
