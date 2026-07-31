# Use It or Lose It: An NFT Validator Leasing System

### The Coffee Shop Problem

Your friend runs a 5-star coffee shop. Spotless. Everyone's favorite.
They pay $6,000/month for a rusted shipping container on a broken road.
The landlord does nothing but collect checks.

> "Don't like it? Someone else will pay more."

Their labor feeds speculation, not growth. The building sits there gaining value while the person actually using it goes broke.

**We can design around this.**

---

### It's Not Just Coffee Shops

A new town gets built. Teachers, nurses, tradespeople, baristas — the people who actually make the place run — move in and do the work that turns it into somewhere people want to be.

That's the exact moment they start getting priced out.

Meanwhile, investors buy up the lots in the center of town — the best spots, the ones with the most foot traffic. They don't live there. They don't open a shop, hire anyone, or add a single thing to the local economy. They just wait. Every new resident who moves in, every teacher and nurse and barista who makes the town worth living in, makes that empty lot more valuable — value the investor did nothing to create. Eventually they sell it, or lease it back, to the very people who made it worth something in the first place.

The people who contribute — labor, service, care, craft — get squeezed out. The people who contribute nothing get paid for showing up early and waiting.

First they move to the edge of town. Then the next town over. The commute grows — 45 minutes, then 90, then 2.5 hours each way — just to do the job that keeps the place running. Six or seven days a week, because one job isn't enough anymore. No time left for family, rest, or anything that looks like a life.

This is modern day slavery. Not as a figure of speech — labor with no exit, no leverage, and none of the value it created.

It doesn't have to be this way. Capital can still flow. Markets can still be free. Land can still be priced, bought, and sold. But the people who make a place valuable shouldn't be the ones systematically pushed out of it. Mechanisms to prevent this already exist — [RadicalXChange (RxC)](https://www.radicalxchange.org/) has done serious work on self-assessed taxation and shared ownership that this project draws on directly.

---

### A Better Way to Own Things

Think about how you'd price your own car for a fast sale: you name a number. If you price it too low, someone can buy it from you on the spot at that price — so you're forced to be honest. Price it too high, and you're the one paying more (in this case, in tax) to hold onto it.

Now apply that to a market stall instead of a storefront. You lease the spot, you pay based on what you say it's worth, and when your lease is up, the market itself buys back your spot — not some landlord who never shows up. Cities already run versions of this for parking permits and public land leases.

We're testing this idea in code first, before trying to apply it anywhere real.

---

### The Digital Lab

Validator NFTs work like leased market stalls. Validators — services or agents providing Sybil-resistant compute (validating AI output, evaluating clients, curating data) — stake NFTs, self-assess their value, pay tax on that value, earn fees, and risk slashing for misconduct.

| Market Stall | Digital System |
|---|---|
| A leased stall | A validator NFT |
| Vendor renting the stall | Validator leasing the NFT |
| Landlord speculation | NFT speculation |
| Rent based on self-priced value | Harberger tax |
| Market fees fund upkeep | DAO revenue |
| Market buys back the spot | Guaranteed NFT buy-back |
| Foot traffic & reputation | Validator performance |

**The cycle:**
1. DAO leases out validator NFTs.
2. Validator stakes, self-assesses value, pays tax on it.
3. DAO collects that tax over the lease.
4. Validator earns network fees for honest work.
5. At lease end, DAO guarantees a buy-back from the tax it collected.

Result: speculation is penalized, participation is rewarded, hoarding is prevented.

---

### Components

| Contract | Purpose |
|---|---|
| `NFTMinting.sol` | ERC-721 minting of validator NFTs |
| `StakingAndTax.sol` | Staking, self-assessment, tax logic |
| `Auction.sol` | Auctions for acquiring NFTs |
| `ProofOfStake.sol` | Transaction validation & fee distribution |
| `Slashing.sol` | Penalties for malicious validators |
| `DAO.sol` | Governance, leasing, supply control, buy-backs |

---

### Key Open Questions

- Optimal tax rate `T(f, s, v)` — maximize DAO revenue without losing validators?
- NFT valuation: `V_nft = Σ (fees_i − taxes_i) / (1 + r)^i`
- Value dynamics under changing network activity: `dV_nft/dt = f(v_tx(t), T(t))`
- Minimum stake `s*` to deter misconduct: `P_slash(s, m)`
- Fair fee split: `F_i = F_total × g(s_i, p_i, c_i)`
- Tax revenue must cover buy-backs: `R_tax ≥ Σ V_buyback_i`
- Auction clearing price: `P_clear = f(V_self, competitor bids)`
- DAO solvency steady-state `S*`, where `dS/dt = f(S, participation, activity)` and inflows = outflows

Mapping and simulating these functions is the core research goal.

---

### Why It Matters

**Web3 today:** NFTs = speculation. Staking = yield farming. Incentives = extractive.
**This system:** NFTs = productive leases. Staking = active work. Incentives = aligned with network health.

Validators don't flip NFTs — they lease them to **work**.

If it works here, it's a testbed for anything people currently rent from someone who adds no value — land, stalls, storefronts, and yes, the coffee shop on the broken road.

---

### Usage

```bash
git clone [repo-url]
npm install
npx hardhat compile
npx hardhat run scripts/deploy.js --network goerli
```

### Tech Stack
Solidity ^0.8.0 · OpenZeppelin (ERC721, Ownable, AccessControl) · Hardhat

### License
MIT

---

*The technical details are in the contracts. The heart is in this vision.*
