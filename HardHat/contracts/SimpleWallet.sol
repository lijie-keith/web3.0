// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleWallet {
    mapping(address => bool) whiteList;

    mapping(address => uint256) balances;

    function addToWhiteList(address _address) public {
        whiteList[_address] = true;
    }

    function isWhiteList(address _address) public view returns (bool) {
        return whiteList[_address];
    }

    function withdraw(address _address, uint256 amount) public {
        require(whiteList[_address], "Recipient is not whitelisted.");
        require(balances[_address] >= amount, "Insufficient balance");
        balances[_address] -= amount;
        address payable recipient = payable(_address);
        recipient.transfer(amount);
    }

    function deposit(address _address, uint256 amount) public {
        require(whiteList[_address], "Recipient is not whitelisted.");
        balances[_address] += amount;
    }

    function getBalance(address _address) public view returns (uint256) {
        require(whiteList[_address], "Recipient is not whitelisted.");
        return balances[_address];
    }
}
