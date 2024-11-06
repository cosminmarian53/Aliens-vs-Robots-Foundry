// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script} from "forge-std/Script.sol";
import {BitBlop} from "src/BitBlop.sol";
import {BloodforgeBot} from "src/BloodforgeBot.sol";
import {CyberAlien} from "src/CyberAlien.sol";
import {GeneralXeno} from "src/GeneralXeno.sol";
import {console} from "forge-std/console.sol";

contract DeployNfts is Script {
    uint256 public DEFAULT_ANVIL_PRIVATE_KEY =
        0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
    uint256 public deployerKey;

    function run()
        external
        returns (BitBlop, BloodforgeBot, CyberAlien, GeneralXeno)
    {
        vm.startBroadcast();

        BitBlop bitBlop = new BitBlop();
        BloodforgeBot bloodforgeBot = new BloodforgeBot();
        CyberAlien cyberAlien = new CyberAlien();
        GeneralXeno generalXeno = new GeneralXeno();

        vm.stopBroadcast();

        return (bitBlop, bloodforgeBot, cyberAlien, generalXeno);
    }
}
