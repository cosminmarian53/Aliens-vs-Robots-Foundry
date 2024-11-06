// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract BitBlop is ERC721, ERC721Burnable {
    error BitBlop__TokenUriNotFound();
    string private constant BITBLOP_TOKEN_URI =
        "https://cosminmarian53.github.io/Data-for-nfts/bitblop.json";
    uint256 private s_tokenId;
    mapping(address => bool) private s_hasMinted;

    constructor() ERC721("BitBlop", "BBP") {
        s_tokenId = 0;
    }

    function mintNft() public {
        require(!s_hasMinted[msg.sender], "Already minted");
        _safeMint(msg.sender, s_tokenId);
        s_tokenId++;
        s_hasMinted[msg.sender] = true;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert BitBlop__TokenUriNotFound();
        }
        return BITBLOP_TOKEN_URI;
    }

    function getTokenId() public view returns (uint256) {
        return s_tokenId;
    }

    function hasMinted(address account) public view returns (bool) {
        return s_hasMinted[account];
    }
}