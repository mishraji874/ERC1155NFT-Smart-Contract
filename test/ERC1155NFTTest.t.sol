// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {ERC1155NFT} from "../src/ERC1155NFT.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC1155NFTTest is Test, ERC1155Holder {
    ERC1155NFT public nft;
    address public owner;
    address public user1;
    address public user2;

    function setUp() public {
        owner = address(this);
        user1 = address(0x1);
        user2 = address(0x2);
        nft = new ERC1155NFT();
    }

    function testInitialMint() public view {
        assertEq(nft.balanceOf(owner, nft.NFT_ID()), 1);
        assertEq(nft.balanceOf(owner, nft.TOKEN_ID()), 100);
    }

    function testMintNFT() public {
        nft.mintNFT(user1, "");
        assertEq(nft.balanceOf(user1, nft.NFT_ID()), 1);
        assertTrue(nft.nftMinted(user1));
    }

    function testFailMintNFTTwice() public {
        nft.mintNFT(user1, "");
        nft.mintNFT(user1, "");
    }

    function testMintToken() public {
        nft.mintToken(user1, 50, "");
        assertEq(nft.balanceOf(user1, nft.TOKEN_ID()), 50);
    }

    function testOnlyOwnerCanMintNFT() public {
        vm.prank(user1);
        vm.expectRevert("Ownable: caller is not the owner");
        nft.mintNFT(user2, "");
    }

    function testOnlyOwnerCanMintToken() public {
        vm.prank(user1);
        vm.expectRevert("Ownable: caller is not the owner");
        nft.mintToken(user2, 50, "");
    }

    function testURI() public view {
        string memory expectedURI = "https://ipfs.io/ipfs/QmSsYRx3LpDAb1GZQm7zZ1AuHZjfbPkD6J7s9r41xu1mf8?filename=pug.png";
        assertEq(nft.uri(nft.NFT_ID()), expectedURI);
        assertEq(nft.uri(nft.TOKEN_ID()), expectedURI);
    }

    function testTransferNFT() public {
        nft.mintNFT(user1, "");
        vm.startPrank(user1);
        nft.setApprovalForAll(address(this), true);
        nft.safeTransferFrom(user1, user2, nft.NFT_ID(), 1, "");
        vm.stopPrank();
        assertEq(nft.balanceOf(user1, nft.NFT_ID()), 0);
        assertEq(nft.balanceOf(user2, nft.NFT_ID()), 1);
    }

    function testTransferToken() public {
        nft.mintToken(user1, 100, "");
        vm.startPrank(user1);
        nft.setApprovalForAll(address(this), true);
        nft.safeTransferFrom(user1, user2, nft.TOKEN_ID(), 50, "");
        vm.stopPrank();
        assertEq(nft.balanceOf(user1, nft.TOKEN_ID()), 50);
        assertEq(nft.balanceOf(user2, nft.TOKEN_ID()), 50);
    }
}