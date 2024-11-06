// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {BitBlop} from "../src/BitBlop.sol";
import {BloodforgeBot} from "../src/BloodforgeBot.sol";
import {CyberAlien} from "../src/CyberAlien.sol";
import {GeneralXeno} from "../src/GeneralXeno.sol";

contract MintBitBlop is Script {
    function run() external {
        address mostRecentlyDeployedBitBlop = DevOpsTools.get_most_recent_deployment("BitBlop", block.chainid);
        mintNftOnContract(mostRecentlyDeployedBitBlop);
    }

    function mintNftOnContract(address bitBlopAddress) public {
        vm.startBroadcast();
        BitBlop(bitBlopAddress).mintNft();
        vm.stopBroadcast();
    }
}

contract MintBloodforgeBot is Script {
    function run() external {
        address mostRecentlyDeployedBloodforgeBot = DevOpsTools.get_most_recent_deployment("BloodforgeBot", block.chainid);
        mintNftOnContract(mostRecentlyDeployedBloodforgeBot);
    }

    function mintNftOnContract(address bloodforgeBotAddress) public {
        vm.startBroadcast();
        BloodforgeBot(bloodforgeBotAddress).mintNft();
        vm.stopBroadcast();
    }
}

contract MintCyberAlien is Script {
    function run() external {
        address mostRecentlyDeployedCyberAlien = DevOpsTools.get_most_recent_deployment("CyberAlien", block.chainid);
        mintNftOnContract(mostRecentlyDeployedCyberAlien);
    }

    function mintNftOnContract(address cyberAlienAddress) public {
        vm.startBroadcast();
        CyberAlien(cyberAlienAddress).mintNft();
        vm.stopBroadcast();
    }
}

contract MintGeneralXeno is Script {
    function run() external {
        address mostRecentlyDeployedGeneralXeno = DevOpsTools.get_most_recent_deployment("GeneralXeno", block.chainid);
        mintNftOnContract(mostRecentlyDeployedGeneralXeno);
    }

    function mintNftOnContract(address generalXenoAddress) public {
        vm.startBroadcast();
        GeneralXeno(generalXenoAddress).mintNft();
        vm.stopBroadcast();
    }
}