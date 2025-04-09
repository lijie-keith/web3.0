// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

struct Transaction {
    address to;
    uint256 value;
    bytes data;
    bool exected;
}
