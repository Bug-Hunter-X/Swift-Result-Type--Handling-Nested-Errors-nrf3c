# Swift Result Type: Handling Nested Errors

This repository demonstrates a common issue when working with Swift's `Result` type and nested asynchronous operations.  The example shows how a top-level error might mask the actual root cause in a chain of asynchronous calls. The solution illustrates how to properly handle and access nested error details for more informative debugging and error reporting.