const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("NFTMinting", function () {
  it("Should deploy and mint an NFT", async function () {
    const [owner] = await ethers.getSigners();
    const NFTMinting = await ethers.getContractFactory("NFTMinting");
    const nftMinting = await NFTMinting.deploy("NFT Proof of Stake", "NFTPOS", 100);

    await nftMinting.mintNFT(owner.address);
    expect(await nftMinting.balanceOf(owner.address)).to.equal(1);
  });
});
