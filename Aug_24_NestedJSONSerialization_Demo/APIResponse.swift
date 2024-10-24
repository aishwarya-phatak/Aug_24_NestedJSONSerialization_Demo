//
//  APIResponse.swift
//  Aug_24_NestedJSONSerialization_Demo
//
//  Created by Vishal Jagtap on 24/10/24.
//

import Foundation

struct APIResponse {
    var page : Int
    var per_page : Int
    var total : Int
    var total_pages : Int
    var data : [User]
    var support : Support
}

struct User{
    var id : Int
    var email : String
    var first_name : String
    var last_name : String
    var avatar : String
}

struct Support{
    var url : String
    var text : String
}
