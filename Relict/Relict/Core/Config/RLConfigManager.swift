//
//  ConfigManager.swift
//  Relict
//
//  Created by jowkame on 7/7/18.
//  Copyright © 2018 jowkame. All rights reserved.
//

import Foundation

class RLConfigManager {
    public var currentConfig: RLWindowConfig! = nil
    
    func processConfigFile() {
        let fileManager = FileManager.default
        let path = fileManager.currentDirectoryPath + "/" + Constants.Config.configFile + "." + Constants.Config.configExt
        let xmlParser = RLXMLConfigParser()
        
        if fileExists(fileManager: fileManager, filePath: path) {
            currentConfig = xmlParser.parseXml(path: path)
        } else {
            let config = RLWindowConfig()
            saveConfigWithDefaultSettings(path: path, config: config)
            
            currentConfig = config
        }
    }
    
    func fileExists(fileManager: FileManager, filePath: String) -> Bool {
        return fileManager.fileExists(atPath: filePath)
    }
    
    func saveConfigWithDefaultSettings(path: String, config: RLWindowConfig) {
        let xmlParser = RLXMLConfigParser()
        let xmlData = xmlParser.buildXmlData(config: config)
        FileManager.default.createFile(atPath: path, contents: xmlData, attributes: nil)
    }
}
