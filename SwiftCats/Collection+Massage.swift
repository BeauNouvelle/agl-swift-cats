//
//  Array+Massage.swift
//  SwiftCats
//
//  Created by Beau Nouvelle on 23/4/21.
//  Copyright © 2021 Yilei He. All rights reserved.
//

import Foundation

extension Collection where Element == Owner {
    
    func catsOnlyGroupedByGender() -> [Gender] {
        let ownersGroupedByGender = Dictionary(grouping: self, by: { $0.gender })
        let pettedGenders = ownersGroupedByGender.map {
            Gender(title: $0.key,
                   catNames: $0.value.flatMap { ($0.pets ?? []).filter { $0.type == "Cat" }.map { $0.name } }.sorted())
        }
        
        return pettedGenders
    }
    
}
