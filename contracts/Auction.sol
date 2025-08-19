// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Auction is Ownable {

    IERC721 public nftContract;
    mapping(uint256 => uint256) public nftBids; // tokenId => highest bid
    mapping(uint256 => address) public nftHighestBidder; // tokenId => highest bidder

    uint256 public auctionDuration = 14 days; // Bi-monthly auction duration

    constructor(IERC721 _nftContract) {
        nftContract = _nftContract;
    }

    function startAuction(uint256 tokenId, uint256 startingPrice) external onlyOwner {
        require(nftContract.ownerOf(tokenId) == msg.sender, "Only owner can start auction");
        nftBids[tokenId] = startingPrice;
    }

    function bidOnNFT(uint256 tokenId) external payable {
        require(msg.value > nftBids[tokenId], "Bid too low");
        nftBids[tokenId] = msg.value;
        nftHighestBidder[tokenId] = msg.sender;
    }

    function endAuction(uint256 tokenId) external {
        address winner = nftHighestBidder[tokenId];
        require(winner != address(0), "No bids placed");

        nftContract.safeTransferFrom(msg.sender, winner, tokenId);
        payable(msg.sender).transfer(nftBids[tokenId]);
    }
}
