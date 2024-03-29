//
//  Classes.swift
//  BeeStats
//
//  Created by Lukas A. Müller on 01/08/16.
//  Copyright © 2016 Lukas Mueller. All rights reserved.
//

import Foundation

struct Stat {
  var key: String
  var value: Int
}

struct GameMode {
  var fullName: String
  var acronym: String
  var stats: [Stat]
}

struct Player {
  var username: String = ""
  var rankName: String = ""
  var tokens: Int = 0
  var uuid: String = ""
  var firstLogin: Int = 0
  var lastLogin: Int = 0
  var lastLogout: Int = 0
  
  // Gamemodes
  
  var gameModes: [GameMode] = []
  
  init() {
  }
  
  init(dictionary: [String: AnyObject]?) {
    
    if let user = dictionary?["username"] as? String {
      username = dictionary?["username"] as! String
      rankName = dictionary?["rankName"] as! String
      tokens = dictionary?["tokens"] as! Int
      uuid = dictionary?["UUID"] as! String
      firstLogin = dictionary?["firstLogin"] as! Int
      lastLogin = dictionary?["lastLogin"] as! Int
      lastLogout = dictionary?["lastLogout"] as! Int
      
      // Survival Games
      
      if let sgDic = dictionary?["sg"] as? [String:AnyObject] {
        let sgStats = GameMode(fullName: "Survival Games", acronym: "SG", stats: [
          Stat(key: "Victories", value: sgDic["victories"] as! Int),
          Stat(key: "Kills", value: sgDic["kills"] as! Int),
          Stat(key: "Deaths", value: sgDic["deaths"] as! Int),
          Stat(key: "Deathmatches", value: sgDic["deathmatches"] as! Int),
          Stat(key: "Points", value: sgDic["points"] as! Int)
          ])
        gameModes.append(sgStats)
      }
      
      // TIMV
      
      if let timvDic = dictionary?["timv"] as? [String:AnyObject] {
        let timvStats = GameMode(fullName: "Trouble in MineVille", acronym: "TIMV", stats: [
          Stat(key: "Detective Points", value: timvDic["detective"] as! Int),
          Stat(key: "Innocent Points", value: timvDic["innocent"] as! Int),
          Stat(key: "Traitor Points", value: timvDic["traitor"] as! Int),
          Stat(key: "Most Points/Round", value: timvDic["mostPoints"] as! Int),
          Stat(key: "Karma", value: timvDic["karma"] as! Int)
          ])
        gameModes.append(timvStats)
      }
      
      // Herobrine
      
      if let hbDic = dictionary?["hb"] as? [String:AnyObject] {
        let hbStats = GameMode(fullName: "The Herobrine", acronym: "HB", stats: [
          Stat(key: "Captures", value: hbDic["captures"] as! Int),
          Stat(key: "Kills", value: hbDic["kills"] as! Int),
          Stat(key: "Deaths", value: hbDic["deaths"] as! Int),
          Stat(key: "KD", value: hbDic["kd"] as! Int),
          Stat(key: "Points", value: hbDic["points"] as! Int)
          ])
        gameModes.append(hbStats)
      }
      
      if let hnsDic = dictionary?["hns"] as? [String:AnyObject] {
        let hnsStats = GameMode(fullName: "Hide and Seek", acronym: "HNS", stats: [
          Stat(key: "Victories", value: hnsDic["victories"] as! Int),
          Stat(key: "Hider Kills", value: hnsDic["hiderKills"] as! Int),
          Stat(key: "Seeker Kills", value: hnsDic["seekerKills"] as! Int),
          Stat(key: "Deaths", value: hnsDic["deaths"] as! Int),
          Stat(key: "Points", value: hnsDic["points"] as! Int)
          ])
        gameModes.append(hnsStats)
    }
    } else {
      print("Failed!")
    }

    
  }
  
}
