// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "@/level0/instance.sol";

contract POC is Script {
    Instance instance = Instance(0x40123A7989f37D4075b5ac9a0b3818930A36F4ab);

    function run() external {
        vm.startBroadcast();
        
        require(!instance.getCleared(), "Level completed already");
        instance.authenticate(instance.password());
        require(instance.getCleared(), "failed to complete level");

        vm.stopBroadcast();
    }
}
