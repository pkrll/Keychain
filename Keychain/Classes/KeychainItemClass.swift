//
//  KeychainItemClass.swift
//  Pods
//
//  Created by Ardalan Samimi on 24/05/16.
//
//
import Foundation
/**
 *  An enum representing the system keychain item types.
 */
public enum KeychainItemClass {
  /**
   *  Generic password item.
   */
  case GenericPassword
  /**
   *  Internet password item.
   */
  case InternetPassword
  /**
   *  Certificate item.
   */
  case Certificate
  /**
   *  Cryptographic key item.
   */
  case Key
  /**
   *  Identity item.
   */
  case Identity
  /**
   *  The class item type will be returned as a string.
   */
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