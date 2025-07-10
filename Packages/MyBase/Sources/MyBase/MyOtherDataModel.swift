//
//  MyOtherDataModel.swift
//  MyBase

public struct MyOtherDataModel: Sendable {
    public let subtitle: String
    public let description: String
    
    public init(subtitle: String, description: String) {
        self.subtitle = subtitle
        self.description = description
    }
}
