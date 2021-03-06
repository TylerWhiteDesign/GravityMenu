//
//  Copyright © 2017 Tyler White. All rights reserved.
//

import UIKit

class RadialMenuView: UIView {
    private let model: RadialMenuModel
    private var controller: RadialMenuController?
    var radius: CGFloat {
        get {
            if let controller = controller {
                return controller.radius
            }
            return 0
        }
        set {
            if let controller = controller {
                controller.radius = newValue
            }
        }
    }
    var delay: Double {
        get {
            if let controller = controller {
                return controller.delay
            }
            return 0
        }
        set {
            if let controller = controller {
                controller.delay = newValue
            }
        }
    }
    var progressClosure: RadialMenuButtonProgressClosure? {
        get {
            if let controller = controller {
                return controller.progressClosure
            }
            return nil
        }
        set {
            if let controller = controller {
                controller.progressClosure = newValue
            }
        }
    }

    
    //MARK: - Setup & Teardown
    
    init(withPrimaryButton primaryButton: UIButton = UIButton(), secondaryButtons: [UIButton]) {
        guard secondaryButtons.count > 0 else {
            fatalError("RadialMenuView needs at least one secondary button to work.")
        }
        self.model = RadialMenuModel(primaryButton: primaryButton, secondaryButtons: secondaryButtons)
        super.init(frame: primaryButton.bounds)
        self.controller = RadialMenuController(withModel: self.model, view: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Overrides
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let controller = controller {
            controller.viewLayoutSubviews()
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if let controller = controller {
            controller.viewDidMoveToSuperview()
        }
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        if let controller = controller {
            controller.viewWillRemoveFromSuperview()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let controller = controller {
            controller.touchesBegan(touches, with: event)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let controller = controller {
            controller.touchesMoved(touches, with: event)
        }    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let controller = controller {
            controller.touchesEnded(touches, with: event)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        if let controller = controller {
            controller.touchesCancelled(touches, with: event)
        }
    }
    
    //MARK: - Public
    
    func open() {
        if let controller = controller {
            controller.state = .open
        }
    }
    
    func close() {
        if let controller = controller {
            controller.state = .closed
        }
    }
    
    //MARK: - Private
    

}
