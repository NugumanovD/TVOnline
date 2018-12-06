//
//  File.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 11/18/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation
import UIKit
@objc protocol CustomNavigationControllerDelegate {
    func pushToNextScene()
}
class CustomNavigationController: UINavigationController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        transitioningDelegate = self
        let top = UIPanGestureRecognizer(target: self, action: Selector(("handleSwipeFromTop:")))
        self.view.addGestureRecognizer(top);
        
    }
    var interactionController: UIPercentDrivenInteractiveTransition?
    func handleSwipeFromTop(gesture: UIPanGestureRecognizer) {
        let percent = gesture.translation(in: gesture.view!).y / gesture.view!.bounds.size.height
        if gesture.state == .began { interactionController = UIPercentDrivenInteractiveTransition()
            if viewControllers.count > 1 { popViewControllerAnimated(true)
            } else {
                dismissViewControllerAnimated(true, completion: nil)
            }
            
        } else if gesture.state == .Changed {
            interactionController?.updateInteractiveTransition(percent)
            
        } else if gesture.state == .Ended {
            if percent > 0.2 { interactionController?.finishInteractiveTransition()
                
            } else { interactionController?.cancelInteractiveTransition()
                
            } interactionController = nil }
        
    }
    // MARK: - UIViewControllerTransitioningDelegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ForwardAnimator() }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BackAnimator()
    }
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
        
    }
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
        
    }
    // MARK: - UINavigationControllerDelegate
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .Push {
            return ForwardAnimator()
            
        } else if operation == .Pop
        { return BackAnimator() }
        return nil }
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController }
    
}
class ForwardAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval { return 0.3 }
    func animateTransition(context: UIViewControllerContextTransitioning) {
        let toView = context.viewControllerForKey(UITransitionContextToViewControllerKey)?.view
        let fromView = context.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view context.containerView().addSubview(toView!)
        toView?.alpha = 0.0 UIView.animateWithDuration(transitionDuration(context), animations: {
            toView?.alpha = 1.0 return }, completion: { finished in context.completeTransition(!context.transitionWasCancelled()) }) } } class BackAnimator : NSObject, UIViewControllerAnimatedTransitioning { func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval { return 0.2 } func animateTransition(context: UIViewControllerContextTransitioning) { let toView = context.viewControllerForKey(UITransitionContextToViewControllerKey)?.view let fromView = context.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view context.containerView().insertSubview(toView!, belowSubview: fromView!) UIView.animateWithDuration(transitionDuration(context), animations: { fromView?.alpha = 0.0 return }, completion: { finished in context.completeTransition(!context.transitionWasCancelled()) }) } } в import UIKit @objc protocol CustomNavigationControllerDelegate { func pushToNextScene() } class CustomNavigationController: UINavigationController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate { override func viewDidLoad() { super.viewDidLoad() transitioningDelegate = self // for presenting the original navigation controller delegate = self // for navigation controller custom transitions let top = UIPanGestureRecognizer(target: self, action: "handleSwipeFromTop:") self.view.addGestureRecognizer(top); } var interactionController: UIPercentDrivenInteractiveTransition? func handleSwipeFromTop(gesture: UIPanGestureRecognizer) { let percent = gesture.translationInView(gesture.view!).y / gesture.view!.bounds.size.height if gesture.state == .Began { interactionController = UIPercentDrivenInteractiveTransition() if viewControllers.count > 1 { popViewControllerAnimated(true) } else { dismissViewControllerAnimated(true, completion: nil) } } else if gesture.state == .Changed { interactionController?.updateInteractiveTransition(percent) } else if gesture.state == .Ended { if percent > 0.2 { interactionController?.finishInteractiveTransition() } else { interactionController?.cancelInteractiveTransition() } interactionController = nil } } // MARK: - UIViewControllerTransitioningDelegate func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? { return ForwardAnimator() } func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? { return BackAnimator() } func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? { return interactionController } func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? { return interactionController } // MARK: - UINavigationControllerDelegate func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? { if operation == .Push { return ForwardAnimator() } else if operation == .Pop { return BackAnimator() } return nil } func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? { return interactionController } } class ForwardAnimator : NSObject, UIViewControllerAnimatedTransitioning { func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval { return 0.3 } func animateTransition(context: UIViewControllerContextTransitioning) { let toView = context.viewControllerForKey(UITransitionContextToViewControllerKey)?.view let fromView = context.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view context.containerView().addSubview(toView!) toView?.alpha = 0.0 UIView.animateWithDuration(transitionDuration(context), animations: { toView?.alpha = 1.0 return }, completion: { finished in context.completeTransition(!context.transitionWasCancelled()) }) } } class BackAnimator : NSObject, UIViewControllerAnimatedTransitioning { func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval { return 0.2 } func animateTransition(context: UIViewControllerContextTransitioning) { let toView = context.viewControllerForKey(UITransitionContextToViewControllerKey)?.view let fromView = context.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view context.containerView().insertSubview(toView!, belowSubview: fromView!) UIView.animateWithDuration(transitionDuration(context), animations: { fromView?.alpha = 0.0 return }, completion: { finished in context.completeTransition(!context.transitionWasCancelled()) }) } }
