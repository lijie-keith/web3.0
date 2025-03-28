// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./struct/Todo.sol";

contract Todos {
    // struct Todo{
    //     string taskName;
    // }

    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo(_text));

        todos.push(Todo({taskName:_text}));

        Todo memory todo;

        todo.taskName = _text;

        todos.push(todo);
    }

    function get(uint256 _index) public view returns(string memory text){
        return todos[_index].taskName;
    }

    function updateTaskName(uint256 _index, string calldata _newText) public{
        Todo storage todo = todos[_index];
        todo.taskName = _newText;
    }
}