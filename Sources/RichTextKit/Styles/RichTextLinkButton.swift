//
//  RichTextLinkButton.swift
//
//
//  Created by Dominik Bucher on 01.12.2023.
//

import SwiftUI

/// This button can be used to toggle a ``Link`` value.
///
/// This view renders a plain `Button`, which means you can use
/// and configure it in all ways supported by SwiftUI. The only
/// exception is the content color, which is set by a style you
/// can provide in the initializer.
///
/// If you want a more prominent button, you may consider using
/// a ``RichTextStyleToggle`` instead, but it requires a higher
/// deployment target.
public struct RichTextLinkButton: View {
    @ObservedObject var context: RichTextContext
    @State private var urlString = ""
    @Binding private var isAlertPresented: Bool
    private func hasLink() -> Binding<Bool> {
        Binding(
            get: { context.link != nil },
            set: { _ in }
        )
    }

    private let fillVertically: Bool

    public init(
        context: RichTextContext,
        isAlertPresented: Binding<Bool>,
        fillVertically: Bool = false
    ) {
        self.context = context
        self._isAlertPresented = isAlertPresented
        self.fillVertically = fillVertically
    }

    public var body: some View {
        Button(
            action: toggle,
            label: {
                Image.richTextKindLink
//                    .frame(maxHeight: fillVertically ? .infinity : nil)
                    .foregroundStyle(.blue)
                    .padding(8)
            }
        )
        .buttonStyle(ToggleButtonStyle(isToggled: isOn))
    }
}

struct ToggleButtonStyle: ButtonStyle {
    var isToggled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(isToggled ? Color.blue.opacity(0.2) : Color.clear)
            .cornerRadius(8)
            .padding()
            .contentShape(Rectangle())
    }
}

extension RichTextLinkButton {
    private var isOn: Bool {
        context.binding(for: context.link).wrappedValue != nil
    }

    private func toggle() {
        // This turns off/disables link.
        if context.link != nil {
            context.setLink(nil)
            context.userActionPublisher.send(.link(url: nil))
        } else {
            isAlertPresented = true
        }
    }
}

struct RichTextLinkButton_Previews: PreviewProvider {
    struct Preview: View {
        var body: some View {
            HStack(spacing: 8) {
                RichTextLinkButton(
                    context: RichTextContext(),
                    isAlertPresented: .constant(false)
                )
            }.padding(8)
        }
    }

    static var previews: some View {
        Preview()
    }
}