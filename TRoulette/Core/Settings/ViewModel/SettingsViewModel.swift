//
//  SettingsViewModel.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Foundation
import StoreKit
import UIKit
import MessageUI
import Observation

@Observable
class SettingsViewModel: NSObject, MFMailComposeViewControllerDelegate {
    
    private let appID = "1111111111"
    
    private let supportEmail = "test@example.com"
    
    var shareAppURL: URL? {
        URL(string: "https://apps.apple.com/app/id\(appID)")
    }
    
    @MainActor
    func rateApp() {
        if let scene = UIApplication.shared
            .connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            
            if #available(iOS 18, *) {
                AppStore.requestReview(in: scene)
            } else {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
    
    func sendFeedbackEmail() {
        
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients([supportEmail])
        mailVC.setSubject("Feedback for Trailcraft App")
        
        if let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }) {
            
            if let rootViewController = windowScene.windows.first?.rootViewController {
                rootViewController.present(mailVC, animated: true)
            }
            
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller.dismiss(animated: true)
    }
}
