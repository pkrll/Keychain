//
//  KeychainItem.swift
//  Pods
//
//  Created by Ardalan Samimi on 24/05/16.
//
//
import Foundation

public class KeychainItem {
  
  // MARK: - Public Properties
  
  /**
   *  The value to save.
   */
  public var value: String? {
    get {
      if let data = self.attributes[kSecValueData as String] as? NSData {
        return String(data: data, encoding: NSUTF8StringEncoding)
      }
      
      return nil
    }
    set {
      if let value = newValue {
        self.attributes[kSecValueData as String] = value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
      } else {
        self.attributes.removeValueForKey(kSecValueData as String)
      }
    }
  }
  /**
   *  Access group key.
   *
   *  Indicates which access group an item is in. Access groups can be used to share keychain items among two or more applications.
   */
  public var accessGroup: String? {
    get {
      return self.attributes[kSecAttrAccessGroup as String] as? String
    }
    set {
      if let accessGroup = newValue {
        self.attributes[kSecAttrAccessGroup as String] = accessGroup
      } else {
        self.attributes.removeValueForKey(kSecAttrAccessGroup as String)
      }
    }
  }
  /**
   *  Set true to sync the item to the iCloud Keychain.
   *  - Note: Default is false.
   */
  public var synchronizable: Bool? {
    get {
      return self.attributes[kSecAttrSynchronizable as String] as? Bool
    }
    set {
      if let doSync = newValue {
        self.attributes[kSecAttrSynchronizable as String] = (doSync) ? kCFBooleanTrue : kCFBooleanFalse
      } else {
        self.attributes.removeValueForKey(kSecAttrSynchronizable as String)
      }
    }
  }
  /**
   *  Description attribute key.
   *
   *  A user-visible string describing this kind of item (for example, "Disk image password").
   */
  public var description: String? {
    get {
      return self.attributes[kSecAttrDescription as String] as? String
    }
    set {
      if let description = newValue {
        self.attributes[kSecAttrDescription as String] = description
      } else {
        self.attributes.removeValueForKey(kSecAttrDescription as String)
      }
    }
  }
  /**
   *  Comment attribute key.
   *
   *  Contains the user-editable comment for this item.
   */
  public var comment: String? {
    get {
      return self.attributes[kSecAttrComment as String] as? String
    }
    set {
      if let comment = newValue {
        self.attributes[kSecAttrComment as String] = comment
      } else {
        self.attributes.removeValueForKey(kSecAttrComment as String)
      }
    }
  }
  /**
   *  Label attribute key.
   *
   *  Contains the user-visible label for this item.
   */
  public var label: String? {
    get {
      return self.attributes[kSecAttrLabel as String] as? String
    }
    set {
      if let label = newValue {
        self.attributes[kSecAttrLabel as String] = label
      } else {
        self.attributes.removeValueForKey(kSecAttrLabel as String)
      }
    }
  }
  /**
   *  Account attribute key.
   *
   *  Contains an account name. Items of class Generic Password and Internet Password have this attribute.
   */
  public var account: String? {
    get {
      return self.attributes[kSecAttrAccount as String] as? String
    }
    set {
      if let account = newValue {
        self.attributes[kSecAttrAccount as String] = account
      } else {
        self.attributes.removeValueForKey(kSecAttrAccount as String)
      }
    }
  }
  /**
   *  Service attribute key.
   *
   *  Represents the service associated with this item. Items of class Generic Password have this attribute.
   */
  public var service: String? {
    get {
      return self.attributes[kSecAttrService as String] as? String
    }
    set {
      if let service = newValue {
        self.attributes[kSecAttrService as String] = service
      } else {
        self.attributes.removeValueForKey(kSecAttrService as String)
      }
    }
  }
  /**
   *  Security domain attribute key.
   *
   *  Represents the Internet security domain. Items of class Internet Password have this attribute.
   */
  public var securityDomain: String? {
    get {
      return self.attributes[kSecAttrSecurityDomain as String] as? String
    }
    set {
      if let securityDomain = newValue {
        self.attributes[kSecAttrSecurityDomain as String] = securityDomain
      } else {
        self.attributes.removeValueForKey(kSecAttrSecurityDomain as String)
      }
    }
  }
  /**
   *  Server attribute key.
   *
   *  Contains the server's domain name or IP address. Items of class Internet Password have this attribute.
   */
  public var server: String? {
    get {
      return self.attributes[kSecAttrServer as String] as? String
    }
    set {
      if let server = newValue {
        self.attributes[kSecAttrServer as String] = server
      } else {
        self.attributes.removeValueForKey(kSecAttrServer as String)
      }
    }
  }
  /**
   *  Protocol attribute key.
   *
   *  Denotes the protocol for this item. Items of class Internet Password have this attribute.
   *  - SeeAlso: KeychainProtocolType for possible values.
   */
  public var internetProtocol: KeychainProtocolType? {
    get {
      if let internetProtocol = self.attributes[kSecAttrProtocol as String] as? String {
        return KeychainProtocolType(rawValue: internetProtocol)
      }
      
      return nil
    }
    set {
      if let internetProtocol = newValue {
        self.attributes[kSecAttrProtocol as String] = internetProtocol.rawValue as String
      } else {
        self.attributes.removeValueForKey(kSecAttrProtocol as String)
      }
    }
  }
  /**
   *  Path attribute key.
   *
   *  Represents a path, typically the path component of the URL. Items of class Internet Password have this attribute.
   */
  public var path: String? {
    get {
      return self.attributes[kSecAttrPath as String] as? String
    }
    set {
      if let path = newValue {
        self.attributes[kSecAttrPath as String] = path
      } else {
        self.attributes.removeValueForKey(kSecAttrPath as String)
      }
    }
  }
  /**
   *  The OSStatus code returned.
   */
  public var OSStatusCode: OSStatus?
  
  // MARK: - Read Only Properties
  
  /**
   *  The item class value (read only)
   *  - Note: This property is set upon initialization.
   */
  public private(set) var itemClass: String
  /**
   *  The attributes dictionary (read only).
   */
  public private(set) var attributes: [String: AnyObject] = [:]
  /**
   *  The search query (read only).
   *
   *  - Note: You can add items with the load(_:) method.
   */
  public private(set) var searchQuery: [String: AnyObject] = [
    kSecAttrSynchronizable as String: kSecAttrSynchronizableAny
  ]
  
  // MARK: - Init
  
  /**
   *  Creates an instance of the Keychain Item structure.
   *  - Parameters:
   *    - withItemClass: The item class of the Keychain item. A KeychainItemClass enum.
   */
  public init(withItemClass itemClass: KeychainItemClass) {
    self.itemClass = itemClass.rawValue
    self.configure()
  }
  
  public init(withItemClass itemClass: KeychainItemClass, attributeDictionary: [String: AnyObject]) {
    self.itemClass = itemClass.rawValue
    self.attributes = attributeDictionary
    self.configure()
  }
  
  public init(attributeDictionary: [String: AnyObject]) {
    self.itemClass = attributeDictionary[kSecClass as String] as? String ?? KeychainItemClass.GenericPassword.rawValue
    self.attributes = attributeDictionary
    self.configure()
  }
  
  private func configure() {
    self.searchQuery[kSecClass as String] = self.itemClass as String
    
    if let acc = self.account {
      self.searchQuery[kSecAttrAccount as String] = acc
    }
    
    if let ser = self.service {
      self.searchQuery[kSecAttrService as String] = ser
    }
  }
  
  // MARK: - Edit Methods
  
  /**
   *  Save the item to the Keychain.
   *  - Note: Before saving, the properties *account* and *service* should be set.
   */
  public func save(value: String? = nil) -> Bool {
    if let value = value {
      self.value = value
    }
    
    if self.attributes.isEmpty || self.value == nil {
      return false
    }
    
    self.attributes[kSecClass as String] = self.itemClass
    
    let result = Keychain.save(self.attributes)
    self.OSStatusCode = result.statusCode
    
    return result.success
  }
  
  public func update(value: String? = nil) -> Bool {
    if let value = value {
      self.value = value
    }
    
    let result = Keychain.update(self.searchQuery, attributes: self.attributes)
    self.OSStatusCode = result.statusCode
    
    return result.success
  }
  
  /**
   *  Load the item from the Keychain.
   *
   *  - Note: The account and service attributes must be set before loading.
   */
  public func load(withQuery query: [String: AnyObject]? = nil) -> Bool {
    guard let account = self.account, let service = self.service else {
      return false
    }
    
    var searchQuery = self.searchQuery
    searchQuery[kSecMatchLimit as String] = kSecMatchLimitOne
    searchQuery[kSecReturnData as String] = kCFBooleanTrue
    searchQuery[kSecReturnAttributes as String] = kCFBooleanTrue
    
    if let queryItems = query {
      for (key, value) in queryItems {
        searchQuery[key] = value
      }
    }
    
    let result = Keychain.load(searchQuery)
    
    if let data = result.data as? [String: AnyObject] {
      self.attributes = data
    }
    
    self.OSStatusCode = result.statusCode
    
    return result.success
  }
  
}