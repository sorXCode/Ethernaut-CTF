# Level 2: Fallout

## Objective

- Claim ownership of the contract

## Intro

Some smart-contracts are ownable, meaning that a central account or accounts can be set as its owner. The owner(s) ften have the ability to perform some actions that are impossible for other actors interacting with the contract to achieve.
Ownership is based on the Role Based Access Control (RBAC) which tells which account is able to perform which function. A typical example is allowing owner of a contract to view balances of tokens in a contract, or withdrawal from token balances. We won't want just any actor to withdrawal tokens balances. 😄

## Instance source code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import 'openzeppelin-contracts-06/math/SafeMath.sol';

contract Fallout {
  
  using SafeMath for uint256;
  mapping (address => uint) allocations;
  address payable public owner;


  /* constructor */
  function Fal1out() public payable {
    owner = msg.sender;
    allocations[owner] = msg.value;
  }

  modifier onlyOwner {
	        require(
	            msg.sender == owner,
	            "caller is not the owner"
	        );
	        _;
	    }

  function allocate() public payable {
    allocations[msg.sender] = allocations[msg.sender].add(msg.value);
  }

  function sendAllocation(address payable allocator) public {
    require(allocations[allocator] > 0);
    allocator.transfer(allocations[allocator]);
  }

  function collectAllocations() public onlyOwner {
    msg.sender.transfer(address(this).balance);
  }

  function allocatorBalance(address allocator) public view returns (uint) {
    return allocations[allocator];
  }
}
```