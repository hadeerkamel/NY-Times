//
//  UIViewControllerExtension.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController{
    
    
    func showActivityIndicatore(presentingView: UIView? = nil) ->  NVActivityIndicatorView{
        let presentingView_ = presentingView ?? self.view
        
        let ACview = NVActivityIndicatorView(frame: CGRect(x:presentingView_!.bounds.midX - 50 , y: presentingView_!.bounds.midY - 100, width: 100, height: 100), type: .orbit,color: UIConstants.Colors.AppMainColor, padding: 5.0)
        
        presentingView_!.addSubview(ACview)
        
        presentingView_!.bringSubviewToFront(ACview)
        ACview.startAnimating()
        
       return ACview
    }
}
