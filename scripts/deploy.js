async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const NFTMinting = await ethers.getContractFactory("NFTMinting");
  const nftMinting = await NFTMinting.deploy("NFT Proof of Stake", "NFTPOS");
  console.log("NFTMinting contract deployed to:", nftMinting.address);

  const StakingAndTax = await ethers.getContractFactory("StakingAndTax");
  const stakingAndTax = await StakingAndTax.deploy(nftMinting.address);
  console.log("StakingAndTax contract deployed to:", stakingAndTax.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
