// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC1155NFT is ERC1155, Ownable {

    uint256 public constant NFT_ID = 1;
    uint256 public constant TOKEN_ID = 2;

    mapping(address => bool) public nftMinted;

    constructor() ERC1155("https://ipfs.io/ipfs/QmSsYRx3LpDAb1GZQm7zZ1AuHZjfbPkD6J7s9r41xu1mf8?filename=pug.png") Ownable(msg.sender) {
        _mint(msg.sender, TOKEN_ID, 100, "");
        _mint(msg.sender, NFT_ID, 1, "");
    }

    function mintNFT(address account, bytes memory data) public onlyOwner {
        require(!nftMinted[account], "NFT already minted");
        nftMinted[account] = true;
        _mint(account, NFT_ID, 1, data);
    }

    function mintToken(address account, uint256 amount, bytes memory data) public onlyOwner {
        _mint(account, TOKEN_ID, amount, data);
    }
}