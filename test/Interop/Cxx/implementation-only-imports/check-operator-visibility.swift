// RUN: %empty-directory(%t)
// RUN: %target-swiftxx-frontend -emit-module -o %t/FortyTwo.swiftmodule -I %S/Inputs %s

// Swift should consider all sources for a decl and recognize that the
// decl is not hidden behind @_implementationOnly in all modules.

// This test, as well as `check-operator-visibility-inversed.swift` checks
// that the operator decl can be found when at least one of the
// modules is not `@_implementationOnly`.

// XFAIL: *

@_implementationOnly import UserA
import UserB

// Operator `+` is a non-member function.
@_inlineable
public func addWrappers() {
  let wrapperA = MagicWrapper()
  let wrapperB = MagicWrapper()
  let _ = wrapperA + wrapperB
}

// Operator `-` is a member function.
@_inlineable
public func subtractWrappers() {
  var wrapperA = MagicWrapper()
  let wrapperB = MagicWrapper()
  let _ = wrapperA - wrapperB
}
