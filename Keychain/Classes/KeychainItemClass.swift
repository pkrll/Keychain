//
//  KeychainItemClass.swift
//  Pods
//
//  Created by Ardalan Samimi on 24/05/16.
//
//
import Foundation

public enum KeychainItemClass {
  
  case GenericPassword
  case InternetPassword
  case Certificate
  case Key
  case Identity
  
  public var rawValue: String {
    switch self {
    case .GenericPassword:
      return kSecClassGenericPassword as String
    case .InternetPassword:
      return kSecClassInternetPassword as String
    case .Certificate:
      return kSecClassCertificate as String
    case .Key:
      return kSecClassKey as String
    case .Identity:
      return kSecClassIdentity as String
    }
  }
  
}