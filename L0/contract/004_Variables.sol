// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Variables {
    string public text = "Hello";
    uint256 i = 456;

    function doSomething() public view returns (address,uint256){
        uint256 timestamp = block.timestamp;
        address sender = msg.sender;
        return (sender, timestamp);
    }
    
}