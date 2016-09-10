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
    fileprivate static let delimiter = CharacterSet(charactersIn: ",")
    
    fileprivate static func getColumns(_ headers: [String], lines: [String]) -> [String: [String]] {
        return Array(lines)[1..<lines.count].reduce([String: [String]]()) { columns, line in
            var newColumns = columns
            let row = line.components(separatedBy: CharacterSet(charactersIn: ","))
            for (index, header) in headers.enumerated() {
                if columns[header] == nil {
                    newColumns[header] = [row[index]]
                } else {
                    newColumns[header]?.append(row[index])
                }
            }
            
            return newColumns
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
        
        let newline = CharacterSet.newlines
        var lines: [String] = []
        contents.trimmingCharacters(in: newline).enumerateLines { line, stop in lines.append(line)
        }
        
        guard lines.count > 1 else {
            self.headers = []
            self.columns = [:]
            return nil
        }
        
        let headers = lines[0].components(separatedBy: CSV.delimiter)
        self.headers = headers
        self.columns = CSV.getColumns(headers, lines: lines)
    }
}
