// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract StakingAndTax is Ownable {
    IERC721 public nftContract;
    mapping(uint256 => uint256) public nftValues;
    mapping(uint256 => uint256) public harbergerTaxes;

    uint256 public taxRate = 10; // Harberger tax rate, adjustable by DAO

    constructor(IERC721 _nftContract) {
        nftContract = _nftContract;
    }

    function selfAssessNFTValue(uint256 tokenId, uint256 newValue) external {
        require(nftContract.ownerOf(tokenId) == msg.sender, "Only owner can self-assess");
        nftValues[tokenId] = newValue;
    }

    function getNFTValue(uint256 tokenId) external view returns (uint256) {
        return nftValues[tokenId];
    }

    function calculateHarbergerTax(uint256 tokenId) public view returns (uint256) {
        uint256 value = nftValues[tokenId];
        return (value * taxRate) / 100;
    }

    function payHarbergerTax(uint256 tokenId) external payable {
        uint256 taxAmount = calculateHarbergerTax(tokenId);
        require(msg.value >= taxAmount, "Insufficient funds to pay tax");
        payable(owner()).transfer(msg.value);
        harbergerTaxes[tokenId] = taxAmount;
    }
}
