forge test --mt testNameIsCorrect

forge install ChainAccelOrg/foundry-devops --no-commit

forge script script/DeployBasicNft.s.sol:DeployBasicNft --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY -vvvv


Rec. DevOps package in home dir