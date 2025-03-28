// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract NestedMapping {   
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr1,uint256 _i) public view returns(bool){
        return nested[_addr1][_i];
    }

    function set(address _addr1,uint256 _i ,bool _b)public{
        nested[_addr1][_i] = _b;
    }   

    function remove(address _addr1,uint256 _i) public {
        delete nested[_addr1][_i];
    }
}