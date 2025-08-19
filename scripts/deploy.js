async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy NFTMinting Contract
  const NFTMinting = await ethers.getContractFactory("NFTMinting");
  const nftMinting = await NFTMinting.deploy("NFT Proof of Stake", "NFTPOS", 100);
  console.log("NFTMinting contract deployed to:", nftMinting.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
