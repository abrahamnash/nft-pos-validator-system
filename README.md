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

# Key Open Questions & Assumptions for Economic Modeling of NFT PoS Validators

## Economic & Incentive Questions
- What is the optimal Harberger tax rate to maximize DAO revenue while maintaining validator participation?  
- How should NFTs be valued based on projected lease lifetime earnings?  
- How do dynamic changes in network activity (e.g., reduced transaction volume) affect NFT value and Harberger taxes?  
- How much stake should be required to effectively deter misconduct without discouraging participation?  
- How should network fees be fairly distributed among validators based on stake, performance, and contribution?  
- How much tax revenue is required to reliably fund buy-backs at the end of NFT lease periods?  
- How will self-assessed NFT values interact with market demand and auction dynamics under Harberger rules?  
- What auction mechanism best balances fairness, liquidity, and price discovery for validator NFTs?  
- Can a steady-state economic model predict long-term solvency of the DAO under variable participation and tax collection?

The NFT PoS validator system raises several interrelated economic and incentive questions that should be mapped and simulated to ensure protocol sustainability. Key considerations include: determining the optimal Harberger tax rate `T(f, s, v)` to maximize DAO revenue while maintaining validator participation; valuing NFTs based on projected lease lifetime earnings, e.g., `V_nft = Σ (expected fees_i − taxes_i) / (1 + r)^i`; modeling dynamic changes in network activity and their effect on NFT value and taxes, `dV_nft/dt = f(v_tx(t), T(t))`; calculating the minimum stake `s*` needed to deter misconduct given a slashing probability function `P_slash(s, m)`; designing fair fee distribution `F_i = F_total × g(s_i, p_i, c_i)`; ensuring sufficient tax revenue `R_tax ≥ Σ V_buyback_i` to fund end-of-lease buy-backs; understanding how self-assessed NFT values interact with market demand and auction clearing prices, `P_clear = f(V_self, competitor bids)`; selecting auction mechanisms `A(V_self, V_market, N_participants)` that balance fairness, liquidity, and price discovery; and modeling DAO solvency as a dynamic system with state `S(t) = {total NFT value, collected taxes, network fees, obligations}` and evolution `dS/dt = f(S, participation, network activity)` to find a steady-state `S*` where inflows equal outflows. Mapping these functions and running simulations (live or offline) is essential to test incentives, economic sustainability, and long-term stability of the protocol.

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
