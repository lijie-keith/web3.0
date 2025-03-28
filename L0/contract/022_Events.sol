// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Event{
    event Log (address indexed sender,string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender,"This is a log");
        emit Log(msg.sender, "hello world!");
        emit AnotherLog();
    }
}