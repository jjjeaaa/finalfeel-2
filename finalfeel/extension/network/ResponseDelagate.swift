//
//  ResponseDelagate.swift
//  finalfeel
//
//  Created by jea on 6/4/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol ResponseDelegate {
    func onApiResponse(user : AuthDataResult)
    func onErrorResponse(error : Error?)
}
