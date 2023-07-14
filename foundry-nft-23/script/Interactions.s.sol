// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {BasicNftFactory} from "../src/BasicNftFactory.sol";

contract MintBasicNft is Script {
    string public constant USER_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlyDeplopyed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeplopyed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(USER_URI);
        vm.stopBroadcast();
    }
}

contract DeployNftContract is Script {
    function run() external {
        address mostRecentlyDeployedBasicNft = DevOpsTools
            .get_most_recent_deployment("BasicNftFactory", block.chainid);
        deployNftContract(mostRecentlyDeployedBasicNft);
    }

    function deployNftContract(address moodNftAddress) public {
        vm.startBroadcast();
        BasicNftFactory(moodNftAddress).createBasicNft();
        vm.stopBroadcast();
    }
}
