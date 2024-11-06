// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployNfts} from "../script/DeployNfts.s.sol";
import {BitBlop} from "../src/BitBlop.sol";
import {BloodforgeBot} from "../src/BloodforgeBot.sol";
import {CyberAlien} from "../src/CyberAlien.sol";
import {GeneralXeno} from "../src/GeneralXeno.sol";
import {Test, console2} from "forge-std/Test.sol";
import {ZkSyncChainChecker} from "lib/foundry-devops/src/ZkSyncChainChecker.sol";

contract NftTest is Test, ZkSyncChainChecker {
    BitBlop public bitBlop;
    BloodforgeBot public bloodforgeBot;
    CyberAlien public cyberAlien;
    GeneralXeno public generalXeno;
    DeployNfts public deployer;
    address public deployerAddress;

    address public constant USER = address(1);

    function setUp() public {
        if (!isZkSyncChain()) {
            deployer = new DeployNfts();
            (bitBlop, bloodforgeBot, cyberAlien, generalXeno) = deployer.run();
        } else {
            bitBlop = new BitBlop();
            bloodforgeBot = new BloodforgeBot();
            cyberAlien = new CyberAlien();
            generalXeno = new GeneralXeno();
        }
    }

    function testBitBlopInitializedCorrectly() public view {
        assert(
            keccak256(abi.encodePacked(bitBlop.name())) ==
                keccak256(abi.encodePacked("BitBlop"))
        );
        assert(
            keccak256(abi.encodePacked(bitBlop.symbol())) ==
                keccak256(abi.encodePacked("BBP"))
        );
    }

    function testBloodforgeBotInitializedCorrectly() public view {
        assert(
            keccak256(abi.encodePacked(bloodforgeBot.name())) ==
                keccak256(abi.encodePacked("BloodforgeBot"))
        );
        assert(
            keccak256(abi.encodePacked(bloodforgeBot.symbol())) ==
                keccak256(abi.encodePacked("BFB"))
        );
    }

    function testCyberAlienInitializedCorrectly() public view {
        assert(
            keccak256(abi.encodePacked(cyberAlien.name())) ==
                keccak256(abi.encodePacked("Cyber-Spliced Alien 3000"))
        );
        assert(
            keccak256(abi.encodePacked(cyberAlien.symbol())) ==
                keccak256(abi.encodePacked("CSA"))
        );
    }

    function testGeneralXenoInitializedCorrectly() public view {
        assert(
            keccak256(abi.encodePacked(generalXeno.name())) ==
                keccak256(abi.encodePacked("GeneralXeno"))
        );
        assert(
            keccak256(abi.encodePacked(generalXeno.symbol())) ==
                keccak256(abi.encodePacked("GXN"))
        );
    }

    function testCanMintAndHaveABalanceBitBlop() public {
        vm.prank(USER);
        bitBlop.mintNft();

        assert(bitBlop.balanceOf(USER) == 1);
    }

    function testCanMintAndHaveABalanceBloodforgeBot() public {
        vm.prank(USER);
        bloodforgeBot.mintNft();

        assert(bloodforgeBot.balanceOf(USER) == 1);
    }

    function testCanMintAndHaveABalanceCyberAlien() public {
        vm.prank(USER);
        cyberAlien.mintNft();

        assert(cyberAlien.balanceOf(USER) == 1);
    }

    function testCanMintAndHaveABalanceGeneralXeno() public {
        vm.prank(USER);
        generalXeno.mintNft();

        assert(generalXeno.balanceOf(USER) == 1);
    }
}
