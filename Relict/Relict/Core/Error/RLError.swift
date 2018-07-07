//
//  RLError.swift
//  Relict
//
//  Created by jowkame on 7/7/18.
//  Copyright © 2018 jowkame. All rights reserved.
//

import Foundation

public enum RLErrorCode: Int {
    case unknown = 12
    case procInitFailed = 13
    case windowInitFailed = 14
    case missingResource = 15
}

public enum RLErrorMessage: String {
    case unknown = "unknown"
    case procInitFailed = "Process init did fail!"
    case missingResource = "Resource is not found!"
    case windowInitFailed = "Window init did fail!"
}

public class RLError {
    public var code: RLErrorCode = .unknown
    public var message: RLErrorMessage = .unknown
    
    public init(code: RLErrorCode, message: RLErrorMessage) {
        self.code = code
        self.message = message
    }
    
    public class func unknownError() -> RLError {
        return RLError(code: .unknown, message: .unknown)
    }
    
    public class func procInitError() -> RLError {
        return RLError(code: .procInitFailed, message: .procInitFailed)
    }
    
    public class func windowInitFail() -> RLError {
        return RLError(code: .windowInitFailed, message: .windowInitFailed)
    }
    
    public class func missingResourceError() -> RLError {
        return RLError(code: .missingResource, message: .missingResource)
    }
}
