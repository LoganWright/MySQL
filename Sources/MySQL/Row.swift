//
//  Row.swift
//  MySQL
//
//  Created by Alsey Coleman Miller on 12/4/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import Foundation
#if os(Linux)
    import CMySQLLinux
#else
    import CMySQLMac
#endif

public extension MySQL {
    
    public struct Row {
        
        // MARK: - Properties
        
        public let values: [NSData]
        
        // MARK: - Initialization
        
        /// Extracts values from pointer.
        internal init(internalPointer: MYSQL_ROW, fieldCount: Int, fieldLengths: [UInt]) {
            
            assert(fieldCount == fieldLengths.count)
            
            let lastFieldIndex = fieldCount - 1
            
            var values = [NSData]()
            
            for i in 0...lastFieldIndex {
                
                let fieldValuePointer = internalPointer[i]
                
                let length = fieldLengths[i]
                
                let data = NSData(bytes: fieldValuePointer, length: Int(length))
                
                values.append(data)
            }
            
            // set values
            self.values = values
        }
        
    }
}