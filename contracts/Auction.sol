// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract Auction {
    IERC721 public nftContract;

    // Mapping to track the auction state of NFTs
    mapping(uint256 => uint256) public auctionEndTime;
    mapping(uint256 => uint256) public highestBid;
    mapping(uint256 => address) public highestBidder;

    constructor(address nftAddress) {
        nftContract = IERC721(nftAddress);
    }

    // Start an auction with a given tokenId and starting price
    function startAuction(uint256 tokenId, uint256 startingPrice) public {
        auctionEndTime[tokenId] = block.timestamp + 3 days;  // 3 days auction time
        highestBid[tokenId] = startingPrice;
    }

    // Place a bid for an NFT
    function bid(uint256 tokenId) public payable {
        require(block.timestamp < auctionEndTime[tokenId], "Auction ended");
        require(msg.value > highestBid[tokenId], "Bid too low");

        address previousBidder = highestBidder[tokenId];
        uint256 previousBid = highestBid[tokenId];

        highestBidder[tokenId] = msg.sender;
        highestBid[tokenId] = msg.value;

        if (previousBidder != address(0)) {
            payable(previousBidder).transfer(previousBid);
        }
    }

    // End an auction and transfer NFT to the highest bidder
    function endAuction(uint256 tokenId) public {
        require(block.timestamp >= auctionEndTime[tokenId], "Auction not yet ended");

        address winner = highestBidder[tokenId];

        // Use slashed value when auctioning a slashed NFT
        uint256 effectiveValue = nftContract.getEffectiveValue(tokenId);

        // If highest bid is higher than effective value, transfer NFT to the winner
        require(highestBid[tokenId] >= effectiveValue, "Bid does not meet reserve price");

        nftContract.transferFrom(msg.sender, winner, tokenId);

        // Reset the slashed value after the auction is complete
        nftContract.resetSlashedValue(tokenId);
    }
}
