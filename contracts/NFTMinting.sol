// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMinting is ERC721Enumerable, Ownable {

    uint256 public nextTokenId;
    uint256 public maxSupply;

    constructor(string memory name, string memory symbol, uint256 _maxSupply) ERC721(name, symbol) {
        nextTokenId = 1;
        maxSupply = _maxSupply;
    }

    function mintNFT(address to) external onlyOwner {
        require(totalSupply() < maxSupply, "Max supply reached");
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }

    function setMaxSupply(uint256 _maxSupply) external onlyOwner {
        maxSupply = _maxSupply;
    }

    function transferNFT(address from, address to, uint256 tokenId) external {
        safeTransferFrom(from, to, tokenId);
    }
}
