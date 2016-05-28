//
//  KeychainProtocolType.swift
//  Pods
//
//  Created by Ardalan Samimi on 24/05/16.
//
//
import Foundation

public enum KeychainProtocolType: Int {

  case FTP
  case FTPS
  case FTPProxy
  case FTPAccount
  case HTTP
  case HTTPS
  case HTTPProxy
  case HTTPSProxy
  case IRC
  case IRCS
  case NNTP
  case NNTPS
  case POP3
  case POP3S
  case SMTP
  case SOCKS
  case IMAP
  case IMAPS
  case LDAP
  case LDAPS
  case AppleTalk
  case AFP
  case Telnet
  case TelnetS
  case SSH
  case SMB
  case RTSP
  case RTSPProxy
  case DAAP
  case DAAPS
  case EPPC
  case IPP
  
  public init(rawValue: String) {
    switch rawValue ?? "" {
    case kSecAttrProtocolFTP as String as String:
      self = .FTP
    case kSecAttrProtocolFTPS as String as String:
      self = .FTPS
    case kSecAttrProtocolFTPProxy as String as String:
      self = .FTPProxy
    case kSecAttrProtocolFTPAccount as String as String:
      self = .FTPAccount
    case kSecAttrProtocolHTTP as String as String:
      self = .HTTP
    case kSecAttrProtocolHTTPS as String as String:
      self = .HTTPS
    case kSecAttrProtocolHTTPProxy as String as String:
      self = .HTTPProxy
    case kSecAttrProtocolIRC as String as String:
      self = .IRC
    case kSecAttrProtocolIRCS as String as String:
      self = .IRCS
    case kSecAttrProtocolNNTP as String as String:
      self = .NNTP
    case kSecAttrProtocolNNTPS as String as String:
      self = .NNTPS
    case kSecAttrProtocolPOP3 as String as String:
      self = .POP3
    case kSecAttrProtocolPOP3S as String as String:
      self = .POP3S
    case kSecAttrProtocolSMTP as String as String:
      self = .SMTP
    case kSecAttrProtocolSOCKS as String as String:
      self = .SOCKS
    case kSecAttrProtocolIMAP as String as String:
      self = .IMAP
    case kSecAttrProtocolIMAPS as String as String:
      self = .IMAPS
    case kSecAttrProtocolLDAP as String as String:
      self = .LDAP
    case kSecAttrProtocolLDAPS as String as String:
      self = .LDAPS
    case kSecAttrProtocolAppleTalk as String as String:
      self = .AppleTalk
    case kSecAttrProtocolAFP as String as String:
      self = .AFP
    case kSecAttrProtocolTelnet as String as String:
      self = .Telnet
    case kSecAttrProtocolTelnetS as String as String:
      self = .TelnetS
    case kSecAttrProtocolSSH as String as String:
      self = .SSH
    case kSecAttrProtocolSMB as String as String:
      self = .SMB
    case kSecAttrProtocolRTSP as String as String:
      self = .RTSP
    case kSecAttrProtocolRTSPProxy as String as String:
      self = .RTSPProxy
    case kSecAttrProtocolDAAP as String as String:
      self = .DAAP
    case kSecAttrProtocolLDAPS as String as String:
      self = .DAAPS
    case kSecAttrProtocolEPPC as String as String:
      self = .EPPC
    case kSecAttrProtocolIPP as String as String:
      self = .IPP
    default:
      self = .HTTP
    }
  }
  
  public var rawValue: String {
    switch self {
    case .FTP:
      return kSecAttrProtocolFTP as String
    case .FTPS:
      return kSecAttrProtocolFTPS as String
    case .FTPProxy:
      return kSecAttrProtocolFTPProxy as String
    case .FTPAccount:
      return kSecAttrProtocolFTPAccount as String
    case .HTTP:
      return kSecAttrProtocolHTTP as String
    case .HTTPS:
      return kSecAttrProtocolHTTPS as String
    case .HTTPProxy:
      return kSecAttrProtocolHTTPProxy as String
    case .HTTPSProxy:
      return kSecAttrProtocolHTTPSProxy as String
    case .IRC:
      return kSecAttrProtocolIRC as String
    case .IRCS:
      return kSecAttrProtocolIRCS as String
    case .NNTP:
      return kSecAttrProtocolNNTP as String
    case .NNTPS:
      return kSecAttrProtocolNNTPS as String
    case .POP3:
      return kSecAttrProtocolPOP3 as String
    case .POP3S:
      return kSecAttrProtocolPOP3S as String
    case .SMTP:
      return kSecAttrProtocolSMTP as String
    case .SOCKS:
      return kSecAttrProtocolSOCKS as String
    case .IMAP:
      return kSecAttrProtocolIMAP as String
    case .IMAPS:
      return kSecAttrProtocolIMAPS as String
    case .LDAP:
      return kSecAttrProtocolLDAP as String
    case .LDAPS:
      return kSecAttrProtocolLDAPS as String
    case .AppleTalk:
      return kSecAttrProtocolAppleTalk as String
    case .AFP:
      return kSecAttrProtocolAFP as String
    case .Telnet:
      return kSecAttrProtocolTelnet as String
    case .TelnetS:
      return kSecAttrProtocolTelnetS as String
    case .SSH:
      return kSecAttrProtocolSSH as String
    case .SMB:
      return kSecAttrProtocolSMB as String
    case .RTSP:
      return kSecAttrProtocolRTSP as String
    case .RTSPProxy:
      return kSecAttrProtocolRTSPProxy as String
    case .DAAP:
      return kSecAttrProtocolDAAP as String
    case .DAAPS:
      return kSecAttrProtocolLDAPS as String
    case .EPPC:
      return kSecAttrProtocolEPPC as String
    case .IPP:
      return kSecAttrProtocolIPP as String
    }
  }
  
}