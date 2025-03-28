// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "L0/contract/struct/MyStruct.sol";

contract DataLocations{
    uint256[] public arr;
    mapping(uint256 => address) dataLocation;

    mapping(uint256 => MyStruct) myStructs;

    function f() public {
        _f(arr,dataLocation,myStructs[1]);

        // MyStruct storage myStruct = myStructs[1];

        // MyStruct memory myMemStruct = MyStruct(0);
    }   

    function _f(uint256[] storage _arr,mapping(uint256 => address) storage _map,MyStruct storage _myStruct) internal  {

    } 
}