# Objective-C Retain Cycle within Block

This repository demonstrates a subtle bug in Objective-C involving retain cycles within blocks.  Improper handling of `self` inside blocks can lead to unexpected memory leaks and object persistence even after the object should have been deallocated.

The `bug.m` file shows the problematic code, where a strong capture of `self` inside a timer's block creates a retain cycle.  The `bugSolution.m` file provides a corrected version using `__weak` or `__strong` qualifiers to break the cycle.

This example highlights the importance of understanding memory management and block behavior in Objective-C to avoid these types of difficult-to-debug issues.  The key takeaway is to be mindful of how `self` is handled in long-lived blocks.