// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployBasicNft;
    BasicNft public basicNft;

    address public USER = makeAddr("user");
    string public constant USER_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployBasicNft = new DeployBasicNft();
        basicNft = deployBasicNft.run();
    }

    function convertToHash(
        string memory string_1,
        string memory string_2
    ) public pure returns (bytes32, bytes32) {
        bytes32 h_1 = keccak256(abi.encodePacked(string_1));
        bytes32 h_2 = keccak256(abi.encodePacked(string_2));

        return (h_1, h_2);
    }

    function testNameIsCorrect() public view {
        // String comparison in Solidity is tricky. We can't just compare
        string memory expectedName = "BasicNft";
        string memory actualName = basicNft.name();
        bytes32 h_expectedName;
        bytes32 h_actualName;

        //We have to compare their keccak256 hashes.
        // bytes32 h_expectedName = keccak256(abi.encodePacked(actualName));
        // bytes32 h_actualName = keccak256(abi.encodePacked(expectedName));
        (h_expectedName, h_actualName) = convertToHash(
            expectedName,
            actualName
        );

        assert(h_expectedName == h_actualName);
    }

    function testCanMintAndHaveBalance() public {
        bytes32 h_expectedURI;
        bytes32 h_actualURI;

        vm.prank(USER);
        basicNft.mintNft(USER_URI);
        assertEq(basicNft.balanceOf(USER), 1);

        (h_expectedURI, h_actualURI) = convertToHash(
            USER_URI,
            basicNft.tokenURI(0)
        );

        assert(h_expectedURI == h_actualURI);
    }
}
