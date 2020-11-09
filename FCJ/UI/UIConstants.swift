//
//  UIConstants.swift
//  FCJ
//

import UIKit

public struct AlphaComponent {
    /// 0
    public static let fullyTransparent: CGFloat = 0.0
    /// 0.2
    public static let light: CGFloat = 0.2
    /// 0.3
    public static let medium: CGFloat = 0.3
    /// 0.4
    public static let normal: CGFloat = 0.4
    /// 0.5
    public static let regular: CGFloat = 0.5
    /// 0.7
    public static let dark: CGFloat = 0.7
    /// 1.0
    public static let fullyVisible: CGFloat = 1.0
}

public struct Margins {
    /// 4
    public static let tiny: CGFloat = 4
    /// 8
    public static let small: CGFloat = 8
    /// 12
    public static let regular: CGFloat = 12
    /// 16
    public static let standard: CGFloat = 16
    /// 18
    public static let medium: CGFloat = 18
    /// 20
    public static let normal: CGFloat = 20
    /// 24
    public static let big: CGFloat = 24
    /// 28
    public static let extraBig: CGFloat = 28
    /// 36
    public static let large: CGFloat = 36
    /// 46
    public static let extraLarge: CGFloat = 46
}

public struct SizeMultiplayers {
    /// 0.7
    public static let regular: CGFloat = 0.7
    /// 0.75
    public static let normal: CGFloat = 0.75
    /// 0.8
    public static let standard: CGFloat = 0.8
    /// 0.85
    public static let medium: CGFloat = 0.85
    /// 0.9
    public static let big: CGFloat = 0.9
    /// 0.95
    public static let extraBig: CGFloat = 0.95
}

public struct Sizes {
    public struct Label {
        public struct Height {
            /// 16
            public static let small: CGFloat = 16
            /// 22
            public static let regular: CGFloat = 22
            /// 32
            public static let medium: CGFloat = 32
            /// 40
            public static let big: CGFloat = 40
            /// 60
            public static let large: CGFloat = 60
        }
    }

    public struct TextField {
        public struct Height {
            /// 34
            public static let medium: CGFloat = 34
            /// 46
            public static let standard: CGFloat = 46
        }
    }

    public struct Button {
        public struct Height {
            /// 24
            public static let small: CGFloat = 24
            /// 30
            public static let regular: CGFloat = 30
            /// 40
            public static let standard: CGFloat = 40
            /// 64
            public static let big: CGFloat = 64
        }
    }

    public struct BorderWidth {
        /// 1
        public static let small: CGFloat = 1
        /// 2
        public static let normal: CGFloat = 2
        /// 3
        public static let medium: CGFloat = 3
        /// 4
        public static let regular: CGFloat = 4
        /// 6
        public static let big: CGFloat = 6
    }

    public struct CornerRadius {
        /// 2
        public static let tiny: CGFloat = 2
        /// 6
        public static let small: CGFloat = 6
        /// 9
        public static let regular: CGFloat = 10
        /// 12
        public static let normal: CGFloat = 12
        /// 16
        public static let large: CGFloat = 16
        /// 21
        public static let extraLarge: CGFloat = 21
        /// 24
        public static let big: CGFloat = 24
    }

    public struct Separator {
        public struct Height {
            /// 1
            public static let small: CGFloat = 1
            /// 2
            public static let regular: CGFloat = 2
            /// 4
            public static let normal: CGFloat = 4
        }
    }
}

public struct AnimationDuration {
    /// 0.1
    public static let fast: Double = 0.1
    /// 0.2
    public static let standard: Double = 0.2
    /// 0.3
    public static let normal: Double = 0.3
    /// 0.5
    public static let regular: Double = 0.5
}

public struct ShadowValues {
    public struct Light {
        /// 0, 4
        public static let offset = CGSize(width: 0, height: 4)
        /// 0.12
        public static let opacity: Float = 0.12
        /// 9
        public static let radius: CGFloat = 9
    }
    
    public struct Regular {
        /// 0, 8
        public static let offset = CGSize(width: 0, height: 8)
        /// 0.15
        public static let opacity: Float = 0.15
        /// 10
        public static let radius: CGFloat = 10
    }
    
    public struct Standard {
        /// 4, 10
        public static let offset = CGSize(width: 4, height: 10)
        /// 0.5
        public static let opacity: Float = 0.5
        /// 10
        public static let radius: CGFloat = 10
    }
}
