// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Immutable {
    address public immutable MY_ADDRESS;

    uint256 public immutable NOTE;

    constructor(uint256 _note){
        MY_ADDRESS = msg.sender;
        NOTE = _note;
    }
}