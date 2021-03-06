//
//  UIIcons.swift
//  TOEFL-Speaking
//
//  Created by Parth Tamane on 11/09/18.
//  Copyright © 2018 Parth Tamane. All rights reserved.
//

import UIKit
import FontAwesome_swift


    
let smallSize: CGSize = CGSize(width: 40, height: 40)
let navItemSize: CGSize = CGSize(width: 30, height: 30)
let swipeActionSize: CGSize = CGSize(width: 30, height: 30)

//let playBtnIcon = UIImage(named: "playg.png")!
let playBtnIcon = UIImage.fontAwesomeIcon(name: .play, style: .solid, textColor: .white, size: smallSize)
//let pauseBtnIcon = UIImage(named: "pauseg.png")!
let pauseBtnIcon = UIImage.fontAwesomeIcon(name: .pause, style: .solid, textColor: .white, size: smallSize)
//let deleteBtnIcon = UIImage(named: "delete.png")!
//let recordIcon = drawSliderThumb(diameter: 40, backgroundColor: enabledRed)
let recordIcon = UIImage.fontAwesomeIcon(name: .microphone, style: .solid, textColor: enabledRed, size: smallSize)

//let emailIcon = UIImage(named: "email.png")!
let emailIcon = UIImage.fontAwesomeIcon(name: .envelope, style: .solid, textColor: .white, size: smallSize)
//let smallEmailIcon = UIImage(named: "rsz_email.png")!
//let githubIcon = UIImage(named: "github.png")!
let githubIcon = UIImage.fontAwesomeIcon(name: .github, style: .brands, textColor: .white, size: smallSize)
let twitterIcon = UIImage.fontAwesomeIcon(name: .twitter, style: .brands, textColor: .white, size: smallSize)


let doubleLeftIcon = UIImage(named: "dleft.png")!
let singleLeftIcon = UIImage(named: "sleft.png")!
let tripleLeftIcon = UIImage(named: "tleft.png")!
let doubleRightIcon = UIImage(named: "dright.png")!
let singleRightIcon = UIImage(named: "sright.png")!
let tripleRightIcon = UIImage(named: "tright.png")!

//let boxIcon = UIImage(named: "box.png")!
let boxIcon = UIImage.fontAwesomeIcon(name: .square, style: .regular, textColor: .white, size: smallSize)
//let deleteIcon = UIImage(named: "delete.png")!
let deleteIcon = UIImage.fontAwesomeIcon(name: .trash, style: .solid, textColor: accentColor, size: smallSize)
//let checkIcon = UIImage(named: "check.png")!
let checkIcon = UIImage.fontAwesomeIcon(name: .check, style: .solid, textColor: confirmGreen, size: smallSize)
//let closeIcon = UIImage(named: "close.png")!
let closeIcon = UIImage.fontAwesomeIcon(name: .times, style: .solid, textColor: confirmGreen, size: smallSize)

//let infoIcon = UIImage(named: "info.png")!
let infoIcon = UIImage.fontAwesomeIcon(name: .info, style: .solid, textColor: .white, size: navItemSize)
//let shareIcon = UIImage(named: "share.png")!
let shareIcon = UIImage.fontAwesomeIcon(name: .share, style: .solid, textColor: .white, size: smallSize)

//let singleShareIcon = UIImage(named: "sshareg.png")!
//let plusIcon = UIImage(named: "plus.png")!
let plusIcon = UIImage.fontAwesomeIcon(name: .chevronDown, style: .solid, textColor: .white, size: smallSize)
//let minusIcon = UIImage(named: "minus.png")!
let minusIcon = UIImage.fontAwesomeIcon(name: .chevronUp, style: .solid, textColor: .white, size: smallSize)

//let discussionIcon = UIImage(named: "dright.png")! //Fix this icon
let discussionIcon = UIImage(named: "discussions.png")! //Fix this icon
//let sideNavIcon = UIImage(named: "bars.png")!
let sideNavIcon = UIImage.fontAwesomeIcon(name: .bars, style: .solid, textColor: accentColor, size: smallSize)
//let sendMessageIcon = UIImage(named: "send_message.png")!
let sendMessageIcon = UIImage.fontAwesomeIcon(name: .paperPlane, style: .light, textColor: accentColor, size: smallSize)


let noImageLogo = UIImage(named: "no-image.png")!
let callIcon = UIImage.fontAwesomeIcon(name: .phoneAlt, style: .solid, textColor: .white, size: smallSize)

//let userPlaceholder = UIImage(named: "user-placeholder")!
let userPlaceholder = UIImage.fontAwesomeIcon(name: .user, style: .solid, textColor: .white, size: navItemSize)
let loggedInUserPlaceholder = UIImage.fontAwesomeIcon(name: .userSecret, style: .solid, textColor: .white, size: navItemSize)

let practiceModeIcon = UIImage.fontAwesomeIcon(name: .pencilAlt, style: .solid, textColor: accentColor, size: navItemSize)
let testModeIcon = UIImage.fontAwesomeIcon(name: .hourglassHalf, style: .solid, textColor: accentColor, size: navItemSize)

let notificationBellIcon =  UIImage.fontAwesomeIcon(name: .bell, style: .solid, textColor: .white, size: navItemSize)

let filteredUserIcon = UIImage.fontAwesomeIcon(name: .userTimes, style: .solid, textColor: .white, size: swipeActionSize)

let unfilteredUserIcon = UIImage.fontAwesomeIcon(name: .userCheck, style: .solid, textColor: .white, size: swipeActionSize)

let blockedUserIcon = UIImage.fontAwesomeIcon(name: .userSlash, style: .solid, textColor: .white, size: swipeActionSize)

let unblockedUserIcon = UIImage.fontAwesomeIcon(name: .userEdit, style: .solid, textColor: .white, size: swipeActionSize)

let deleteMessageIcon = UIImage.fontAwesomeIcon(name: .trash, style: .solid, textColor: .white, size: swipeActionSize)
