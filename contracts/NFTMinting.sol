// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMinting is ERC721Enumerable, Ownable {
    uint256 public nextTokenId;
    uint256 public maxSupply;

    // Mapping for self-assessed values
    mapping(uint256 => uint256) public nftValue;
    
    // Mapping for slashed values (used when slashing occurs)
    mapping(uint256 => uint256) public slashedValue;

    constructor(string memory name, string memory symbol, uint256 _maxSupply) ERC721(name, symbol) {
        nextTokenId = 1;
        maxSupply = _maxSupply;
    }

    // Mint NFTs with an initial value
    function mintNFT(address to) external onlyOwner {
        require(totalSupply() < maxSupply, "Max supply reached");
        _safeMint(to, nextTokenId);
        nftValue[nextTokenId] = 1 ether;  // Initial value
        nextTokenId++;
    }

    // Set the self-assessed value of an NFT (can be updated by the owner)
    function selfAssessNFTValue(uint256 tokenId, uint256 newValue) external {
        require(ownerOf(tokenId) == msg.sender, "Only owner can set value");
        nftValue[tokenId] = newValue;
    }

    // Function to get the effective value of an NFT (including slashing)
    function getEffectiveValue(uint256 tokenId) external view returns (uint256) {
        // If slashed, return the slashed value, else return the regular value
        if (slashedValue[tokenId] > 0) {
            return slashedValue[tokenId];
        }
        return nftValue[tokenId];
    }

    // Allow the DAO or owner to set the maximum supply
    function setMaxSupply(uint256 _maxSupply) external onlyOwner {
        maxSupply = _maxSupply;
    }

    // Function to transfer NFT ownership
    function transferNFT(address from, address to, uint256 tokenId) external {
        safeTransferFrom(from, to, tokenId);
    }
}
