//
//  Constants.swift
//  Relict
//
//  Created by jowkame on 7/6/18.
//  Copyright © 2018 jowkame. All rights reserved.
//

import Foundation

class Constants {
    class Window {
        public static var defaultWidth: Int = 800
        public static var defaultHeight: Int = 600
        public static var defaultTitle: String = "Relict App"
    }
    
    class Config {
        public static var configFile: String = "config"
        public static var configExt: String = "xml"
        
        class ElementsKey {
            public static var root: String = "relict_config"
            public static var windowWidth: String = "window_width"
            public static var windowHeight: String = "window_height"
            public static var windowX: String = "window_x"
            public static var windowY: String = "window_y"
            public static var isCentered: String = "is_window_centered"
        }
    }
}
