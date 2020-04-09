//
//  SocialDelegate.swift
//  finalfeel
//
//  Created by jea on 6/4/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import Foundation


protocol SocialDelegate {
    func onFBSuccessResponse(user : Any)
    func onFBErrorResponse(error : Error?)
    
    func onGoogleSuccessResponse(user : Any)
    func onGoogleErrorResponse(error : Error?)
}
