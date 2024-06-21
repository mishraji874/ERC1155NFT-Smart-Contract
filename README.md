# ERC-1155 Multi-Token NFT Smart Contract

This smart contract implements the ERC-1155 standard, enabling the creation and management of multiple NFT (Non-Fungible Token) types within a single contract.

## Features:

- Multi-Token Support: Create and manage various NFT types, each with distinct properties and functionalities.
- Fungible & Non-Fungible Options: Support both fungible (identical tokens) and non-fungible (unique tokens) within the same contract.
- Minting & Burning: Allow authorized users to mint (create) and burn (destroy) NFTs.
- Transfer & Approval: Implement standard mechanisms for transferring and approving NFT ownership.
- Optional URI Support: Optionally configure URIs (links) to store additional NFT metadata (e.g., image, description).

## Getting Started:

### Installation and Deployment

1. Clone the repository:
   ```bash
   git clone https://github.com/mishraji874/ERC1155NFT-Smart-Contract.git
2. Navigate to the project directory:
    ```bash
    cd ERC1155NFT-Smart-Contract
3. Initialize Foundry and Forge:
    ```bash
    forge init
4. Create the ```.env``` file and paste the [Alchemy](https://www.alchemy.com/) api for the Sepolia Testnet and your Private Key from the Metamask.

5. Compile and deploy the smart contracts:

    If you want to deploy to the local network anvil then run this command:
    ```bash
    forge script script/DeployERC1155NFT.s.sol --rpc-url {LOCAL_RPC_URL} --private-key {PRIVATE_KEY}
    ```
    If you want to deploy to the Sepolia testnet then run this command:
    ```bash
    forge script script/DeployERC1155NFT.s.sol --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY}
### Running Tests

Run the automated tests for the smart contract:

```bash
forge test
```

## Configuration:

- The contract can be configured to specify the initial owner (deployer) and any other authorized minters/burners.
- Optionally, configure a base URI for storing NFT metadata off-chain.

## Additional Notes:

- This is a basic implementation and can be extended to include additional features like:
    - Royalty payments for creators on secondary sales.
    - On-chain metadata storage (alternative to URIs).
    - Integration with NFT marketplaces.
- Refer to the ERC1155NFT.sol and ERC1155NFTTest.t.sol files for detailed contract logic and test cases.

## Security Considerations:

- Smart contract audits by reputable security firms are highly recommended.
- Carefully review access control mechanisms to ensure secure minting and burning functionalities.

This ERC-1155 smart contract provides a versatile foundation for creating and managing diverse NFT collections on a blockchain platform.