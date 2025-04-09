// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./structs/Todo.sol";

/**
 * TodoList: 是类似便签一样功能的东西，记录我们需要做的事情，以及完成状态。 1.需要完成的功能

    创建任务
    修改任务名称
        任务名写错的时候
    修改完成状态：
        手动指定完成或者未完成
        自动切换
            如果未完成状态下，改为完成
            如果完成状态，改为未完成
获取任务
    思考 1：思考任务 ID 的来源？ 我们在传统业务里，这里的任务都会有一个任务 ID，在区块链里怎么实现？？ 
    答：传统业务里，ID 可以是数据库自动生成的，也可以用算法来计算出来的，比如使用雪花算法计算出 ID 等。
    在区块链里我们使用数组的 index 索引作为任务的 ID，也可以使用自增的整型数据来表示。 
    思考 2: 我们使用什么数据类型比较好？ 
    答：因为需要任务 ID，如果使用数组 index 作为任务 ID。则数据的元素内需要记录任务名称，任务完成状态，所以元素使用 struct 比较好。 
    如果使用自增的整型作为任务 ID，则整型 ID 对应任务，使用 mapping 类型比较符合。
 * @title 
 * @author 
 * @notice 
 */
contract TodoList {
    Todo[] public todoList;

    function create(string memory _name) external {
        todoList.push(Todo({name: _name, isCompleted: false}));
    }

    function modifyName(uint256 _index, string memory _name) external {
        todoList[_index].name = _name;
    }

    function modifyStatus(uint256 _index, bool _status) external {
        todoList[_index].isCompleted = _status;
    }

    function get(
        uint256 _index
    ) external view returns (string memory _name, bool _status) {
        Todo storage temp = todoList[_index];
        return (temp.name, tmep.isCompleted);
    }
}
