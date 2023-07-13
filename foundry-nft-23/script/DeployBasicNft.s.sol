// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {BasicNftFactory} from "../src/BasicNftFactory.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract DeployBasicNft is Script {
    function run() external returns (BasicNft) {
        vm.startBroadcast();
        BasicNft basicNft = new BasicNft();
        vm.stopBroadcast();
        return basicNft;
    }
}

contract DeployBasicNftFactory is Script {
    function run() external returns (BasicNftFactory) {
        vm.startBroadcast();
        BasicNftFactory basicNftFactory = new BasicNftFactory();
        vm.stopBroadcast();
        return basicNftFactory;
    }
}