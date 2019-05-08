//
//  EnclosedTextBetweenLines.swift
//  TextWithLines
//
//  Created by Daniel Hjärtström on 2019-04-03.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class EnclosedTextBetweenLines: UIView {
    
    private lazy var leftLayer: CAShapeLayer = {
        let temp = CAShapeLayer()
        temp.frame = bounds
        temp.strokeColor = UIColor.white.withAlphaComponent(0.5).cgColor
        temp.lineCap = .round
        temp.strokeEnd = 1.0
        temp.lineWidth = 2.0
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY))
        temp.path = path.cgPath
        layer.addSublayer(temp)
        return temp
    }()
    
    private lazy var rightLayer: CAShapeLayer = {
        let temp = CAShapeLayer()
        temp.frame = bounds
        temp.strokeColor = UIColor.white.withAlphaComponent(0.5).cgColor
        temp.lineCap = .round
        temp.strokeEnd = 1.0
        temp.lineWidth = 2.0
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        path.addLine(to: CGPoint(x: label.frame.maxX, y: bounds.midY))
        temp.path = path.cgPath
        layer.addSublayer(temp)
        return temp
    }()

    private lazy var label: UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor.white
        temp.textAlignment = .center
        temp.minimumScaleFactor = 0.7
        temp.adjustsFontSizeToFitWidth = true
        temp.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        temp.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        temp.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 90.0).isActive = true
        return temp
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureFrames()
    }
    
    private func configureFrames() {
        leftLayer.path = leftLayerPath()
        rightLayer.path = rightLayerPath()
    }
    
    convenience init(text: String) {
        self.init(frame: CGRect.zero)
        label.text = text
    }
    
    private func commonInit() {
        backgroundColor = UIColor.clear
    }

    private func leftLayerPath() -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.midY))
        path.addLine(to: CGPoint(x: label.frame.origin.x, y: bounds.midY))
        return path.cgPath
    }
    
    private func rightLayerPath() -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        path.addLine(to: CGPoint(x: label.frame.maxX, y: bounds.midY))
        return path.cgPath
    }
    
}
