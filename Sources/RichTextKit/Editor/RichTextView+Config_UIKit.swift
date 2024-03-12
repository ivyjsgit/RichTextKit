//
//  RichTextView+Config_UIKit.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2024-01-16.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

#if iOS || os(tvOS) || os(visionOS)
import SwiftUI

public extension RichTextView {

    /**
     This type can be used to configure a ``RichTextEditor``.
     */
    struct Configuration {

        /**
         Create a custom configuration.

         - Parameters:
           - isScrollingEnabled: Whether or not the editor should scroll, by default `true`.
           - allowsEditingTextAttributes: If editor allows editing text attributes, by default `true`.
           - autocapitalizationType: Type of Auto capitalization, default is to `.sentences`.
           - spellCheckingType: Whether textView spell-Checks, default is `.no`.
         */
        public init(
            isScrollingEnabled: Bool = true,
            allowsEditingTextAttributes: Bool = true,
            autocapitalizationType: UITextAutocapitalizationType = .sentences,
            spellCheckingType: UITextSpellCheckingType = .no,
            useFormattingWhenPastingText: Bool = true
        ) {
            self.isScrollingEnabled = isScrollingEnabled
            self.allowsEditingTextAttributes = allowsEditingTextAttributes
            self.autocapitalizationType = autocapitalizationType
            self.spellCheckingType = spellCheckingType
            self.useFormattingWhenPastingText = useFormattingWhenPastingText
        }

        /// Whether or not the editor should scroll.
        public var isScrollingEnabled: Bool

        /// Whether textView allows editing text attributes
        public var allowsEditingTextAttributes: Bool

        /// Whether textView allows uses formatting from pasted text
        public var useFormattingWhenPastingText: Bool


        /// Kind of auto capitalization
        public var autocapitalizationType: UITextAutocapitalizationType

        /// If TextView spell-checks the text.
        public var spellCheckingType: UITextSpellCheckingType
    }
}
#endif
