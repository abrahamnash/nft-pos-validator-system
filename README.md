# NFT Proof of Stake Validator System

A decentralized Ethereum-based Proof of Stake system where validators stake NFTs, earn network fees, pay Harberger taxes, and face slashing for misconduct. This approach reduces token speculation, aligning incentives with honest participation and sustainable blockchain ecosystem growth.

## Components
- **NFTMinting.sol**: ERC-721 contract for minting validator NFTs.
- **StakingAndTax.sol**: Logic for staking NFTs, self-assessment, and Harberger tax.
- **Auction.sol**: Auction contract for validators to acquire NFTs.
- **ProofOfStake.sol**: Manages transaction validation and fee distribution.
- **Slashing.sol**: Slashing logic for penalizing malicious validators.
- **DAO.sol**: Governance and supply control.

## Usage
1. Clone the repo
2. Install dependencies: `npm install`
3. Compile contracts: `npx hardhat compile`
4. Deploy contracts to testnet: `npx hardhat run scripts/deploy.js --network goerli`

## Technologies
- Solidity ^0.8.0
- OpenZeppelin ERC721, Ownable, AccessControl
- Hardhat/Truffle for testing & deployment

## License
This project is licensed under the MIT License.
