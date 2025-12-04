# MyToken (ERC-20) – MTK

MyToken is a fully functional ERC-20 compatible token built using **Solidity** and deployed through **Remix IDE**.  
This project demonstrates the core mechanisms behind ERC-20 tokens including transfers, allowances, and event logging.

---

## 🚀 Overview

MyToken is a simple learning-oriented ERC-20 token implementation designed to help beginners understand how token smart contracts work on the Ethereum blockchain.

---

## 🔗 Token Details

| Property     | Value                     |
| ------------ | ------------------------- |
| **Name**     | MyToken                   |
| **Symbol**   | MTK                       |
| **Decimals** | 18                        |
| **Supply**   | 1,000,000 MTK (1 million) |

Total supply is assigned to the deployer during contract deployment.

---

## ✅ Features

- Fully compatible ERC-20 token
- Transfer tokens between wallets
- Approve spenders to use your tokens
- `transferFrom` allows delegated transfers
- Emits **Transfer** and **Approval** events
- Balance tracking for all addresses
- Helper function `getTokenInfo()` to retrieve metadata

---

## 🛠️ How to Deploy (Using Remix IDE)

1. Open Remix: https://remix.ethereum.org
2. Create file: **MyToken.sol**
3. Paste the contract code
4. Select compiler version **0.8.x**
5. Compile the contract
6. Go to **Deploy & Run Transactions**
7. Select **JavaScript VM**
8. Enter total supply for deployment (example for 1,000,000 tokens with 18 decimals):
