# NFT Proof of Stake Validator System

A decentralized, blockchain-based proof-of-stake (PoS) system where validator extensions—services or agents that build on top of the underlying blockchain—stake NFTs, earn network fees, pay Harberger taxes, and face slashing for misconduct. Unlike base-layer consensus validators, these validator extensions provide verifiable compute for tasks requiring Sybil resistance—such as validating AI model outputs, evaluating clients, or curating data.  

By requiring stake and subjecting validators to Harberger taxes and slashing, the system discourages token speculation and aligns incentives toward honest, ongoing participation. Drawing from **RadicalXChange** principles and the concept of **partial common ownership**, this model fosters a sustainable and economically cooperative blockchain ecosystem.  

Additionally, the DAO **leases validator NFTs as property for sale**, collecting Harberger taxes during the lease period. At the end of the lease, the DAO **guarantees buy-backs** using the taxes it has collected, mirroring real-world models used for public goods and housing in Singapore, Taiwan, Norway (oil drilling), and other contexts. This mechanism ensures long-term stability, prevents speculative hoarding, and maintains economic sustainability.  

## Components
- **NFTMinting.sol**: ERC-721 contract for minting validator NFTs.
- **StakingAndTax.sol**: Logic for staking NFTs, self-assessment, and Harberger tax.
- **Auction.sol**: Auction contract for validators to acquire NFTs.
- **ProofOfStake.sol**: Manages transaction validation and fee distribution.
- **Slashing.sol**: Slashing logic for penalizing malicious validators.
- **DAO.sol**: Governance, leasing, and supply control, including guaranteed buy-backs.

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
