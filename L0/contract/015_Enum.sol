// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Enum {
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceld
    }

    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.Canceld;
    }

    function reset() public {
        delete status;
    }
}