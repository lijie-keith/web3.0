// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/**
 * 众筹合约是一个募集资金的合约，在区块链上，我们是募集以太币，类似互联网业务的水滴筹。区块链早起的 ICO 就是类似业务。
 * 两种角色:
 *  受益人   beneficiary => address         => address 类型
 *  资助者   funders     => address:amount  => mapping 类型 或者 struct 类型
 * 状态变量(众筹的业务)：
 *  筹资目标数量 fundingGoal
 *  当前募集数量 fundingAmount
 *  资助者列表   funders
 *  资助者人数   fundersKey
 * 需要部署时传入的数据:
 *  受益人
 *  筹资目标数量
 *
 * @title
 * @author
 * @notice
 */
contract CrowdFunding {
    address public immutable beneficiary;
    uint256 public immutable fundingGoal;
    uint256 public fundingAmount;
    mapping(address => uint256) public funders;

    mapping(address => bool) private fundersInserted;
    address[] public fundersKey;

    bool public AVAILABLED = true; //selfdestruct

    constructor(address _beneficiary, uint256 _fundingGoal) {
        beneficiary = _beneficiary;
        fundingGoal = _fundingGoal;
    }

    function contribute() external payable {
        require(AVAILABLED, "CrowdFunding is closed");

        uint256 potentialFudingAmount = fundingAmount + msg.value;
        uint256 refundAmount = 0;

        if (potentialFudingAmount > fundingGoal) {
            refundAmount = potentialFudingAmount - fundingGoal;
            funders[msg.sender] += (msg.value - refundAmount);
            fundingAmount += (msg.value - refundAmount);
        } else {
            funders[msg.sender] += msg.value;
            fundingAmount += msg.value;
        }

        if (!fundersInserted[msg.sender]) {
            fundersInserted[msg.sender] = true;
            fundersKey.push(msg.sender);
        }

        if (refundAmount > 0) {
            payable(msg.sender).transfer(refundAmount);
        }
    }

    function close() external returns (bool) {
        if (fundingAmount < fundingGoal) {
            return false;
        }
        uint256 amount = fundingAmount;
        fundingAmount = 0;
        AVAILABLED = false;
        payable(beneficiary).transfer(amount);
        return true;
    }
    

    function fundersLength() public view returns (uint256) {
        return fundersKey.length;
    }
}
