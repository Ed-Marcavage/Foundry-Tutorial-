// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployBasicNft;
    BasicNft public basicNft;

    function setUp() public {
        deployBasicNft = new DeployBasicNft();
        basicNft = deployBasicNft.run();
    }

    function testNameIsCorrect() public view {
        // String comparison in Solidity is tricky. We can't just compare
        string memory expectedName = "BasicNft";
        string memory actualName = basicNft.name();

        //We have to compare their keccak256 hashes.
        bytes32 h_expectedName = keccak256(abi.encodePacked(actualName));
        bytes32 h_actualName = keccak256(abi.encodePacked(expectedName));

        assert(h_expectedName == h_actualName);
    }
}
