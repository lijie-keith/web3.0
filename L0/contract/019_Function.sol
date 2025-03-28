// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Function{
    function returnMany() public pure returns (uint256 ,bool ,uint256){
        return (1,true ,2);
    }

    function named() public pure returns (uint256 a,bool b,uint256 c){
        return (1,true ,2);
    }
    
    function assigned() public pure returns (uint256 a, bool b,uint256 c){
        a = 1;
        b = true;
        c = 2;
    }

    function destructuringAssignments() public pure returns (uint256, bool, uint256, uint256, uint256)
    {
        (uint256 i, bool b, uint256 j) = returnMany();

        (uint256 x,, uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }
}

contract XYZ{
    function someFuncWithManyInputs(uint256 x,uint256 y,uint256 z,address a,bool b,string memory c) public pure returns(uint256){

    }

    function callFunc() external pure returns (uint256){
        return someFuncWithManyInputs(1,2,3,address(0), true,"test");
    }

    function callFuncWithKeyValue() external pure returns (uint256) {
        return someFuncWithManyInputs({
            a: address(0),
            b: true,
            c: "c",
            x: 1,
            y: 2,
            z: 3
        });
    }
}

contract ViewAndPure {
    uint256 public x = 1;

    function addToX(uint256 y) public view returns (uint256) {
        return x + y;
    }

    function add(uint256 i, uint256 j) public pure returns (uint256) {
        return i + j;
    }
}