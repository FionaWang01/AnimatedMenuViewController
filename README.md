# AnimatedMenuViewController

API: UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate

```
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
    
```
```
func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
```
### ps:

```
override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

@IBAction func closeOnWind (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
```
