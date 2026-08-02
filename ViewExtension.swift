//
//  ViewExtension.swift
//
//  Created by Correa Arango on 8/15/24.
//

import SwiftUI

extension View {
	func accessibilityModifiers(
		hidden: Bool = false,
		addTraits: AccessibilityTraits = [],
		removeTraits: AccessibilityTraits = [],
		label: String? = nil,
		hint: String? = nil
	) -> some View {
		self
			.accessibilityHidden(hidden)
			.accessibilityAddTraits(addTraits)
			.accessibilityRemoveTraits(removeTraits)
			.accessibilityLabel(label ?? "")
			.accessibilityHint(hint ?? "")
	}
}
