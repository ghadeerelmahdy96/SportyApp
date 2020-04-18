//
//  RemoteHandler.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/18/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation

protocol RemoteHandlerProtocol {
    func fetchData(param:Any , completionHandler:@escaping (_ result:[Any])->Void)
}
