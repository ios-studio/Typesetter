//
//  CSV.swift
//  Typesetter
//
//  Created by Beat Richartz on 06/02/2016.
//  Copyright © 2016 Beat Richartz. All rights reserved.
//

import Foundation

class CSV {
    let headers: [String]
    let columns: [String: [String]]
    private static let delimiter = NSCharacterSet(charactersInString: ",")
    
    private static func getColumns(headers: [String], lines: [String]) -> [String: [String]] {
        return Array(lines)[1..<lines.count].reduce([String: [String]]()) { (var columns, line) in
            let row = line.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ","))
            for (index, header) in headers.enumerate() {
                if columns[header] == nil {
                    columns[header] = [row[index]]
                } else {
                    columns[header]?.append(row[index])
                }
            }
            
            return columns
        }
    }
    
    init?(contentsOfFile file: String) {
        let contents: String
        do {
            contents = try String(contentsOfFile: file)
        } catch {
            self.headers = []
            self.columns = [:]
            return nil
        }
        
        let newline = NSCharacterSet.newlineCharacterSet()
        var lines: [String] = []
        contents.stringByTrimmingCharactersInSet(newline).enumerateLines { line, stop in lines.append(line)
        }
        
        guard lines.count > 1 else {
            self.headers = []
            self.columns = [:]
            return nil
        }
        
        let headers = lines[0].componentsSeparatedByCharactersInSet(CSV.delimiter)
        self.headers = headers
        self.columns = CSV.getColumns(headers, lines: lines)
    }
}