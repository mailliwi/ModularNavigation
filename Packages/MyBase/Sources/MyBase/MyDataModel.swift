//
//  MyDataModel.swift
//  MyBase

import Foundation

public struct MyDataModel: Sendable {
    public let title: String
    public let code: Int
    
    public init(title: String, code: Int) {
        self.title = title
        self.code = code
    }
}
