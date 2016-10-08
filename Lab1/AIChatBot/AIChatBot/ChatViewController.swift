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
    private var speakingLoop = 0
    
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
        
        switch self.speakingLoop {
        case 0:
            break
        default:
            break
        }
        
        self.finishSendingMessage(animated: true)
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
    
    // MARK: Helpers
    
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
