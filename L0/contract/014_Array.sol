// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Array {
    uint256[] public arr;

    uint256[] public arr2 = [1,2,3];

    uint256[] public myFixedSizeArr;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    function getArr() public view  returns (uint256[] memory){
        return arr;
    }

    function push(uint256 i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop(); 
    }

    function getLength() public view returns (uint256){
        return arr.length;
    }

    function remove(uint256 index) public {
        delete arr[index];
    }

    function examples() external pure returns (uint256[] memory){
        uint256[] memory a = new uint256[](5);
        return a;
    }

    function rermoveByShifting(uint256 _index) public {
        require(_index < arr.length,"Index out of bounds");
        for (uint256 i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function testByShifting() external {
        arr = [1,2,3,4,5];
        remove(2);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }

    function removeFromEnd(uint256 index) public{
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

    function testFromEnd() external {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }

}