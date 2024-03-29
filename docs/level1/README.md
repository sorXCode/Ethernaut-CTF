# Level 1: Fallback

## Objective

- claim ownership of the contract
- Reduce the balance to 0

## Intro

Some smart-contracts are ownable, meaning that a central account or accounts can be set as its owner. The owner(s) ften have the ability to perform some actions that are impossible for other actors interacting with the contract to achieve.
Ownership is based on the Role Based Access Control (RBAC) which tells which account is able to perform which function. A typical example is allowing owner of a contract to view balances of tokens in a contract, or withdrawal from token balances. We won't want just any actor to withdrawal tokens balances. 😄

## Instance source code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {

  mapping(address => uint) public contributions;
  address public owner;

  constructor() {
    owner = msg.sender;
    contributions[msg.sender] = 1000 * (1 ether);
  }

  modifier onlyOwner {
        require(
            msg.sender == owner,
            "caller is not the owner"
        );
        _;
    }

  function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] += msg.value;
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
  }

  function getContribution() public view returns (uint) {
    return contributions[msg.sender];
  }

  function withdraw() public onlyOwner {
    payable(owner).transfer(address(this).balance);
  }

  receive() external payable {
    require(msg.value > 0 && contributions[msg.sender] > 0);
    owner = msg.sender;
  }
}
```

