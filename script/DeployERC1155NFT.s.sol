// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {ERC1155NFT} from "../src/ERC1155NFT.sol";

contract DeployERC1155NFT is Script {
    ERC1155NFT erc1155nft;

    function run() public returns (ERC1155NFT) {
        vm.startBroadcast();
        erc1155nft = new ERC1155NFT();
        console.log("Deployed at address: ", address(erc1155nft));
        vm.stopBroadcast();
        return erc1155nft;
    }
}