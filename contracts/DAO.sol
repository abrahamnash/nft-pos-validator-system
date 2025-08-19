// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./NFTMinting.sol";

contract DAO is Ownable {
    NFTMinting public nftMintingContract;

    constructor(NFTMinting _nftMintingContract) {
        nftMintingContract = _nftMintingContract;
    }

    function mintNFT(address to) external onlyOwner {
        nftMintingContract.mintNFT(to);
    }

    function setMaxSupply(uint256 maxSupply) external onlyOwner {
        nftMintingContract.setMaxSupply(maxSupply);
    }

    function updateSlashingParameters(uint256 slashingRate, uint256 minSlashingAmount) external onlyOwner {
        // Governance-controlled parameters
    }
}
