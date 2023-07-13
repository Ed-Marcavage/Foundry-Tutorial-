// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {BasicNft} from "./BasicNft.sol";

contract BasicNftFactory {
    BasicNft[] public deployedContracts;

    function createBasicNft() public {
        BasicNft newBasicNft = new BasicNft();
        deployedContracts.push(newBasicNft);
    }

    function getDeployedContracts() public view returns (BasicNft[] memory) {
        return deployedContracts;
    }
}
