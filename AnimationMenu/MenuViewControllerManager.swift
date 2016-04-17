//
//  MenuViewControllerManager.swift
//  AnimationMenu
//
//  Created by babykang on 16/4/17.
//  Copyright © 2016年 babykang. All rights reserved.
//

import UIKit

class MenuViewControllerManager: NSObject, UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate {
    
    private var presenting = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()
        let screen : (from:UIViewController, to: UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        let menuViewController = !self.presenting ? screen.from as! MenuViewController : screen.to as! MenuViewController
        let bottomViewController = !self.presenting ? screen.from as! UIViewController : screen.to as! UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        if (self.presenting){
            self.offStateMentViewController(menuViewController)
        }
        container?.addSubview(menuView)
        container?.addSubview(bottomView)
        
        let duration = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            
               if (self.presenting){
                       self.onStageMenuView(menuViewController)
                  }else{
                      self.offStateMentViewController(menuViewController)
                 }
            
            }, completion: {finished in
                transitionContext.completeTransition(true)
                UIApplication.sharedApplication().keyWindow?.addSubview(screen.to.view)
        })
    }
    
    func offState (amount:CGFloat) -> CGAffineTransform{
        return CGAffineTransformMakeTranslation(amount, 0)
    }
    
    func offStateMentViewController (menuViewController:MenuViewController){
        
        menuViewController.view.alpha = 0
        let topLocation: CGFloat = 300
        let botLocation : CGFloat = 100
        
        menuViewController.link.transform = self.offState(topLocation)
        menuViewController.linkLabel.transform = self.offState(topLocation)
        
        menuViewController.Music.transform = self.offState(-topLocation)
        menuViewController.musicLabel .transform = self.offState(-topLocation)
        
        menuViewController.photo.transform = self.offState(-botLocation)
        menuViewController.photoLabel.transform = self .offState(-botLocation)
        
        menuViewController.text.transform = self.offState(botLocation)
        menuViewController.textLabel.transform = self.offState(botLocation)
    }
    
    func onStageMenuView(menuViewController:MenuViewController){
        menuViewController.view.alpha = 1
        menuViewController.link.transform = CGAffineTransformIdentity
        menuViewController.linkLabel.transform = CGAffineTransformIdentity
        menuViewController.Music.transform = CGAffineTransformIdentity
        menuViewController.musicLabel.transform = CGAffineTransformIdentity
        menuViewController.text.transform = CGAffineTransformIdentity
        menuViewController.textLabel.transform = CGAffineTransformIdentity
        menuViewController.photo.transform = CGAffineTransformIdentity
        menuViewController.photoLabel.transform = CGAffineTransformIdentity
        
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    
    
    
    
    
    
    
    
}
