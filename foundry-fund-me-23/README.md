Constants and immutable to optimize gas cost 
- Constants and immutable can only be declared if updated once
- immutable can be declared once, in the constructor
variables set in the constructor can be labled as immutable

forge snapshot --mt testWithDrawFromMultipleFunders
forge test --mt testWithdrawFromASingleFunder -vv
forge inspect FundMe storageLayout


