// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./NFTMinting.sol";

contract Slashing {
    // Reference to the NFTMinting contract
    NFTMinting public nftContract;

    // Only the DAO can call this function to slash an NFT
    constructor(address nftAddress) {
        nftContract = NFTMinting(nftAddress);
    }

    // Slash the value of an NFT by a given percentage
    function slashNFT(uint256 tokenId, uint256 percentage) external {
        // Only the DAO or the owner can slash
        require(msg.sender == nftContract.owner() || msg.sender == nftContract.owner(), "Not authorized");

        uint256 currentValue = nftContract.nftValue(tokenId);
        uint256 reduction = (currentValue * percentage) / 100;
        uint256 newSlashedValue = currentValue - reduction;

        nftContract.slashedValue(tokenId) = newSlashedValue;
    }

    // Function to reset slashed value after auction or a period
    function resetSlashedValue(uint256 tokenId) external {
        require(msg.sender == nftContract.owner(), "Only DAO can reset");

        nftContract.slashedValue(tokenId) = 0;
    }

    // Check if NFT is slashed (returns the slashed value)
    function getSlashedValue(uint256 tokenId) external view returns (uint256) {
        return nftContract.slashedValue(tokenId);
    }
}
