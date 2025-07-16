//
//  PresentationStyle.swift
//  MyInfrastructure

import Foundation

/// The presentation style used when navigating to a new view.
public enum PresentationStyle {
    
    case push
    case present(modal: Bool)
    
}
