//
//  ViewController.swift
//  AIChatBot
//
//  Created by Nikita Khomitsevich on 9/30/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit
import JSQMessagesViewController

public let personID = "personID"

class ChatViewController:  JSQMessagesViewController {

    public var person: Person?
    
    private var userAge: Int = -1
    private var phraseCounter: Int = 1
    private var firstInput: Bool = true
    
    private var messages = [JSQMessage]()
    private var incomingBubble: JSQMessagesBubbleImage!
    private var outgoingBubble: JSQMessagesBubbleImage!
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.messages = [messageAboutName, messageAboutAge]
        
        incomingBubble = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
        outgoingBubble = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImage(with: UIColor.lightGray)
        
        collectionView?.collectionViewLayout.incomingAvatarViewSize = CGSize(width: kJSQMessagesCollectionViewAvatarSizeDefault, height:kJSQMessagesCollectionViewAvatarSizeDefault )
        collectionView?.collectionViewLayout.outgoingAvatarViewSize = CGSize(width: kJSQMessagesCollectionViewAvatarSizeDefault, height:kJSQMessagesCollectionViewAvatarSizeDefault )
        
        automaticallyScrollsToMostRecentMessage = true
        
        self.collectionView?.reloadData()
        self.collectionView?.layoutIfNeeded()
    }
    
    // MARK: JSQMessagesViewController Override
    
    override func didPressSend(_ button: UIButton, withMessageText text: String, senderId: String, senderDisplayName: String, date: Date) {
        self.messages.append(JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text))
        if firstInput { self.userAge = self.parseUserAge(input: text) }
        
        if self.checkUserAgeCorrectness() {
            firstInput = false
            
            self.makeDialog()
            self.phraseCounter++
        } else {
            self.messages.append(repeatMessageAboutAge)
        }
        
        self.finishSendingMessage(animated: true)
//        Thread.sleep(forTimeInterval: 0.3)
    }
    
    // MARK: JSQMessagesCollectionViewDataSource
    
    override func senderId() -> String {
        return personID
    }
    
    override func senderDisplayName() -> String {
        return self.getPersonName()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView, messageDataForItemAt indexPath: IndexPath) -> JSQMessageData {
        return messages[(indexPath as NSIndexPath).item]
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView, messageBubbleImageDataForItemAt indexPath: IndexPath) -> JSQMessageBubbleImageDataSource {
        return messages[(indexPath as NSIndexPath).item].senderId == self.senderId() ? outgoingBubble : incomingBubble
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView, avatarImageDataForItemAt indexPath: IndexPath) -> JSQMessageAvatarImageDataSource? {
        let chatBotAvatar = JSQMessagesAvatarImageFactory().avatarImage(withUserInitials: chatBotInitial,
                                                                        backgroundColor: UIColor.jsq_messageBubbleBlue(),
                                                                        textColor: UIColor.white,
                                                                        font: UIFont.systemFont(ofSize: 12))
        
        let personAvatar = JSQMessagesAvatarImageFactory().avatarImage(withUserInitials: self.getInitialsFromPersonInfo(),
                                                                       backgroundColor: UIColor.jsq_messageBubbleGreen(),
                                                                       textColor: UIColor.white,
                                                                       font: UIFont.systemFont(ofSize: 12))
        
        return messages[(indexPath as NSIndexPath).item].senderId == self.senderId() ? personAvatar : chatBotAvatar
        
    }
    
    // MARK: Private Methods
    
    private func makeDialog() {
        if userAge >= 0 && userAge <= 5 {
            if phraseCounter == 1 {
                self.messages.append(messageChild1)
            } else if phraseCounter == 2 {
                self.messages.append(messageChild2)
            } else if phraseCounter == 3 {
                self.messages.append(messageChild3)
            } else if phraseCounter == 4 {
                self.messages.append(messageChild4)
                self.messages.append(exitMessage)
            }
            
            if phraseCounter == 5 {
                _ = self.navigationController?.popViewController(animated: true)
            }
        } else if userAge >= 6 && userAge <= 17 {
            if phraseCounter == 1 {
                self.messages.append(messageTeenager1)
            } else if phraseCounter == 2 {
                self.messages.append(messageTeenager2)
            } else if phraseCounter == 3 {
                self.messages.append(messageTeenager3)
            } else if phraseCounter == 4 {
                self.messages.append(messageTeenager4)
            } else if phraseCounter == 5 {
                self.messages.append(messageTeenager5)
                self.messages.append(exitMessage)
            }
            
            if phraseCounter == 6 {
                _ = self.navigationController?.popViewController(animated: true)
            }
        } else if userAge >= 18 && userAge <= 23 {
            if phraseCounter == 1 {
                self.messages.append(messageYoung1)
            } else if phraseCounter == 2 {
                self.messages.append(messageYoung2)
            } else if phraseCounter == 3 {
                self.messages.append(messageYoung3)
            } else if phraseCounter == 4 {
                self.messages.append(messageYoung4)
            } else if phraseCounter == 5 {
                self.messages.append(messageYoung5)
            } else if phraseCounter == 6 {
                self.messages.append(messageYoung6)
                self.messages.append(exitMessage)
            }
            
            if phraseCounter == 7 {
                _ = self.navigationController?.popViewController(animated: true)
            }
        } else if userAge >= 24 && userAge <= 45 {
            if phraseCounter == 1 {
                self.messages.append(messageAdult1)
            } else if phraseCounter == 2 {
                self.messages.append(messageAdult2)
            } else if phraseCounter == 3 {
                self.messages.append(messageAdult3)
            } else if phraseCounter == 4 {
                self.messages.append(messageAdult4)
            } else if phraseCounter == 5 {
                self.messages.append(messageAdult5)
                self.messages.append(exitMessage)
                
            }
            
            if phraseCounter == 6 {
                _ = self.navigationController?.popViewController(animated: true)
            }
        } else if userAge >= 46 && userAge <= 65 {
            if phraseCounter == 1 {
                self.messages.append(messageOld1)
            } else if phraseCounter == 2 {
                self.messages.append(messageOld2)
            } else if phraseCounter == 3 {
                self.messages.append(messageOld3)
            } else if phraseCounter == 4 {
                self.messages.append(messageOld4)
            } else if phraseCounter == 5 {
                self.messages.append(messageOld5)
                self.messages.append(exitMessage)
            }
            
            if phraseCounter == 6 {
                _ = self.navigationController?.popViewController(animated: true)
            }
        } else if userAge >= 66 && userAge <= 99 {
            if phraseCounter == 1 {
                self.messages.append(messageOldest1)
            } else if phraseCounter == 2 {
                self.messages.append(messageOldest2)
            } else if phraseCounter == 3 {
                self.messages.append(messageOldest3)
                self.messages.append(exitMessage)
            }
            
            if phraseCounter == 4 {
                _ = self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func nextBotPhrase(phrase msg: JSQMessage) {
        self.messages.append(msg)
    }
    
    private func checkUserAgeCorrectness() -> Bool {
        if self.userAge == -1 || self.userAge > 99 {
            return false
        }
        return true
    }
    
    private func parseUserAge(input text: String) -> Int {
        let numberCharacters = NSCharacterSet.decimalDigits
        for i in 0..<text.characters.count {
            guard let _ = String(text[text.index(text.startIndex, offsetBy: i)]).rangeOfCharacter(from: numberCharacters) else {
                return -1
            }
        }
        
        return Int(text)!
    }
    
    private func getPersonName() -> String {
        return String((self.person?.name)! + " " + (self.person?.surname)!)
    }
    
    private func getInitialsFromPersonInfo() -> String {
        var initials = String()
        if let name = self.person?.name, let surname = self.person?.surname {
            initials = String(describing: name.characters.first!).uppercased() + String(describing: surname.characters.first!).uppercased()
        }
        return initials
    }
}
