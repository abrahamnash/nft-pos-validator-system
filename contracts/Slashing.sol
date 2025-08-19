// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract Slashing {
    IERC721 public nftContract;
    mapping(uint256 => uint256) public slashedValues;

    constructor(IERC721 _nftContract) {
        nftContract = _nftContract;
    }

    function slashValidator(uint256 tokenId, uint256 slashingPercentage) external {
        uint256 currentValue = slashedValues[tokenId];
        uint256 reducedValue = (currentValue * (100 - slashingPercentage)) / 100;
        slashedValues[tokenId] = reducedValue;
    }

    function getSlashedValue(uint256 tokenId) external view returns (uint256) {
        return slashedValues[tokenId];
    }
}
