// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    // Token ID counter
    uint256 s_tokenCounter;

    // Mapping from token ID to URI
    mapping(uint256 => string) private s_tokenIdToUri;

    // Constructor inherits ERC721
    constructor() ERC721("BasicNft", "BNFT") {
        s_tokenCounter = 0;
    }

    // calls ERC721 _safeMint
    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    // returns the URI for a given token ID
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
