// RUN: %target-typecheck-verify-swift -requirement-machine-inferred-signatures=on
// RUN: %target-swift-frontend -typecheck -debug-generic-signatures %s -requirement-machine-inferred-signatures=on 2>&1 | %FileCheck %s

struct G<T> {}

// CHECK-LABEL: Generic signature: <T where T == Error>
extension G where T : Error, T == Error {}
// expected-warning@-1 {{redundant conformance constraint 'any Error' : 'Error'}}
