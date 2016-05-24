//
//  Keychain.swift
//  Pods
//
//  Created by Ardalan Samimi on 24/05/16.
//
//
import Foundation
/**
 *  Just another Keychain class.
 *  - Author: Ardalan Samimi
 */
public struct Keychain {
  
  static let service: String = NSBundle.mainBundle().bundleIdentifier ?? ""
  
  // MARK: - Basic Keychain Methods
  /**
   *  Quick save an item to the keychain.
   *  - Parameters:
   *    - value: The string value to save to the keychain.
   *    - forKey: The name of the entry.
   *  - Returns: True if operation was successful.
   */
  public static func save(value: String, forKey key: String) -> Bool {
    let query: [String: AnyObject] = [
      kSecClass as String       : kSecClassGenericPassword as String,
      kSecAttrAccount as String : key,
      kSecAttrService as String : self.service,
      kSecValueData as String   : value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
    ]
    
    return self.secItemAdd(query) == noErr
  }
  /**
   *  Load an item from the keychain.
   *  - Parameters:
   *    - key: Name of the saved password.
   *  - Returns: A string value.
   */
  public static func load(key: String) -> String? {
    let query: [String: AnyObject] = [
      kSecClass as String       : kSecClassGenericPassword as String,
      kSecMatchLimit as String  : kSecMatchLimitOne,
      kSecReturnData as String  : kCFBooleanTrue,
      kSecAttrService as String : self.service,
      kSecAttrAccount as String : key
    ]
    
    if let data = self.secItemCopy(query).data as? NSData {
      return String(data: data, encoding: NSUTF8StringEncoding)!
    }
    
    return nil
  }
  /**
   *  Deletes an item from the keychain.
   *  - Parameter key: Name of the item.
   *  - Returns: A boolean value.
   */
  public static func delete(key: String) -> Bool {
    let query: [String: AnyObject] = [
      kSecClass as String       : kSecClassGenericPassword as String,
      kSecAttrService as String : self.service,
      kSecAttrAccount as String : key
    ]
    
    return self.secItemDelete(query) == noErr
  }
  
  // MARK: - Advanced Keychain Methods
  /**
   *  Save an item to the keychain.
   *
   *  This method allows for more advanced usage and requires a valid attributes dictionary.
   *  - Parameters:
   *    - attributes: A dictionary containing an item class key-value pair and optional attribute key-value pairs specifying the item's attribute values.
   *  - SeeAlso: [Keychain Services Reference](xcdoc://?url=developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys)
   *  - Returns: A tuple with two members, reflecting the status of the operation.
   */
  public static func save(attributes: [String: AnyObject]) -> (success: Bool, statusCode: OSStatus) {
    let status = self.secItemAdd(attributes)
    
    return (success: (status == noErr), statusCode: status)
  }
  /**
   *  Load an item from the keychain.
   *
   *  This method allows for more advanced usage and requires a valid attributes dictionary.
   *  - Parameters:
   *    - attributes: A dictionary containing an item class specification and optional attributes for controlling the search.
   *  - SeeAlso: [Keychain Services Reference](xcdoc://?url=developer.apple.com/library/ios/documentation/Security/Reference/keychainservices/index.html#//apple_ref/doc/constant_group/Attribute_Item_Keys)
   *  - Returns: A tuple with three members, reflecting the status of the operation and the data fetched, if any.
   */
  public static func load(attributes: [String: AnyObject]) -> (success: Bool, statusCode: OSStatus, data: AnyObject?) {
    let result = secItemCopy(attributes)
    
    return (success: (result.status == errSecSuccess), statusCode: result.status, data: result.data)
  }
  
}

private extension Keychain {
  
  static func secItemCopy(attributes: [String: AnyObject]) -> (status: OSStatus, data: AnyObject?) {
    var result: AnyObject?
    let status: OSStatus = withUnsafeMutablePointer(&result) {
      SecItemCopyMatching(attributes as CFDictionaryRef, UnsafeMutablePointer($0))
    }
    
    return (status, result)
  }
  
  static func secItemAdd(attributes: [String: AnyObject]) -> OSStatus {
    self.secItemDelete(attributes)
    return SecItemAdd(attributes, nil)
  }
  
  static func secItemUpdate(attributes: [String: AnyObject]) {
    
  }
  
  static func secItemDelete(attributes: [String: AnyObject]) -> OSStatus {
    return SecItemDelete(attributes as CFDictionaryRef)
  }
  
}