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
        
        do {
            let xmlDoc = try XMLDocument(contentsOf: URL(fileURLWithPath: path), options: XMLNode.Options(rawValue: 0))
            let rootXmlDoc = xmlDoc.rootElement()!
            
//            for child in rootXmlDoc.children! {
//                if child.name! == Constants.Config.ElementsKey.windowWidth {
//                    config.width = Int(child.objectValue as! String)!
//                } else if child.name! == Constants.Config.ElementsKey.windowHeight {
//                    config.height = Int(child.objectValue as! String)!
//                } else if child.name! == Constants.Config.ElementsKey.windowX {
//                    config.x = Int(child.objectValue as! String)!
//                } else if child.name! == Constants.Config.ElementsKey.windowY {
//                    config.y = Int(child.objectValue as! String)!
//                } else if child.name! == Constants.Config.ElementsKey.isCentered {
//                    config.isCentered = (child.objectValue as! String == "true")
//                }
//            }
        } catch {
            
        }

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
