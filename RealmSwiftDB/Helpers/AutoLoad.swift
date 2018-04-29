
//
//  AutoLoad.swift
//  RealmSwiftDB
//
//  Created by Artemii Shabanov on 28.04.2018.
//  Copyright © 2018 Artemii Shabanov. All rights reserved.
//

import Foundation

func loadPublishingHouses() {
    let ph1 = PublishingHouse()
    ph1.name = "P. house 1"
    let ph2 = PublishingHouse()
    ph2.name = "P. house 2"
    let ph3 = PublishingHouse()
    ph3.name = "P. house 3"
    let ph4 = PublishingHouse()
    ph4.name = "P. house 4"
    let ph5 = PublishingHouse()
    ph5.name = "P. house 5"
    try! realm.write {
        realm.add(ph1)
        realm.add(ph2)
        realm.add(ph3)
        realm.add(ph4)
        realm.add(ph5)
    }
}

func loadGenres() {
    let g1 = Genre()
    g1.name = "Science fiction"
    let g2 = Genre()
    g2.name = "Drama"
    let g3 = Genre()
    g3.name = "Fantasy"
    let g4 = Genre()
    g4.name = "Horror"
    let g5 = Genre()
    g5.name = "Children's"
    g5.parentGenre = g4
    try! realm.write {
        realm.add(g1)
        realm.add(g2)
        realm.add(g3)
        realm.add(g4)
        realm.add(g5)
    }
}
