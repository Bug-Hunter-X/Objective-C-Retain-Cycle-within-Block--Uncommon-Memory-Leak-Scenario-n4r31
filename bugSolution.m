The solution involves using `__weak` to break the retain cycle. By declaring `__weak typeof(self) weakSelf = self;` we create a weak reference to `self`. The block now holds a weak reference, preventing the retain cycle.  The block accesses the object through the weakSelf variable.  Check for nil within the block before using weakSelf to safely handle situations where self may have already been deallocated.  Alternatively, you could use `__strong typeof(self) strongSelf = self` and explicitly assign it to nil when finished within the block to explicitly break the reference. 

```objectivec
@interface MyObject : NSObject
@property (nonatomic, strong) NSTimer *myTimer;
@end

@implementation MyObject
- (instancetype)init {
    self = [super init];
    if (self) {
        __weak typeof(self) weakSelf = self; 
        self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            __strong typeof(self) strongSelf = weakSelf;
            if (strongSelf) {
                NSLog(@"Timer fired!");
            }
        }];
    }
    return self;
}
- (void)dealloc {
    NSLog(@"MyObject deallocated");
}
@end
```