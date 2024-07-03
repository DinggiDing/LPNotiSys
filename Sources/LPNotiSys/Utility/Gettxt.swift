//
//  File.swift
//  
//
//  Created by 성재 on 7/3/24.
//

import Foundation

public struct Gettxt {
    
    public static func readTextFile(name: String) -> String? {
        let bundle = Bundle.module
        let txt_name = "SentData_" + name
        guard let url = bundle.url(forResource: txt_name, withExtension: "txt") else {
            print("Resource not found")
            return nil
        }
        
        do {
            let content = try String(contentsOf: url, encoding: .utf8)
            let lines = content.components(separatedBy: .newlines)
            let randomIndex = Int.random(in: 0..<lines.count)
            let message = lines[randomIndex]
            return message
        } catch {
            print("Failed to read content: \(error)")
            return nil
        }
    }
}
