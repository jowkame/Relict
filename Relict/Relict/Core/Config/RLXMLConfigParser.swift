//
//  XMLConfigParser.swift
//  Relict
//
//  Created by jowkame on 7/7/18.
//  Copyright © 2018 jowkame. All rights reserved.
//

import Foundation

class RLXMLConfigParser {
    func parseXml(path: String) -> RLWindowConfig {
        var config = RLWindowConfig()
        
        let data = NSData(contentsOfFile: path)!


        let file = UnsafeMutablePointer<FILE>.allocate(capacity: 1)



        let pointer = data.bytes.bindMemory(to: FILE.self, capacity: 1)
        let a = xml_open_document(pointer)
        
        return config
    }
    
    
    func buildXmlData(config: RLWindowConfig) -> Data {
        let root = XMLElement(name: Constants.Config.ElementsKey.root)
        let xml = XMLDocument(rootElement: root)
        
        let windowWidth = XMLElement(name: Constants.Config.ElementsKey.windowWidth, stringValue: "\(config.width)")
        let windowHeight = XMLElement(name: Constants.Config.ElementsKey.windowHeight, stringValue: "\(config.height)")
        let windowX = XMLElement(name: Constants.Config.ElementsKey.windowX, stringValue: "\(config.x)")
        let windowY = XMLElement(name: Constants.Config.ElementsKey.windowY, stringValue: "\(config.y)")
        let windowCentered = XMLElement(name: Constants.Config.ElementsKey.isCentered, stringValue: "\(config.isCentered)")

        root.addChild(windowWidth)
        root.addChild(windowHeight)
        root.addChild(windowX)
        root.addChild(windowY)
        root.addChild(windowCentered)
        
        return xml.xmlData(options: [.nodePrettyPrint])
    }
}
