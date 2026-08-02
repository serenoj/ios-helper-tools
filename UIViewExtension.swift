//
//  UIViewExtension.swift
//
//  Created by Correa Arango on 8/16/24.
//

import UIKit

extension UIView {
	
	func setupAccessibility(
		isElement: Bool = true,
		label: String? = nil,
		hint: String? = nil,
		value: String? = nil,
		traits: UIAccessibilityTraits = [],
		frame: CGRect? = nil
	) {
		isAccessibilityElement = isElement
		accessibilityLabel = label ?? accessibilityLabel
		accessibilityHint = hint ?? accessibilityHint
		accessibilityValue = value ?? accessibilityValue
		accessibilityTraits = traits
		if let frame = frame {
			accessibilityFrame = frame
		}
	}
}
