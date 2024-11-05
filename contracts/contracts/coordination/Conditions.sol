// SPDX-License-Identifier: AGPL-3.0-or-later

pragma solidity ^0.8.0;

/**
 * @title GlobalAllowList
 * @notice TBD
 */
contract Conditions {
    struct Condition {
        address owner;
        string conditionString;
    }

    mapping(uint256 id => Condition condition) public conditions;
    uint256 public length;

    event ConditionCreated(uint256 indexed id, string conditionString);

    event ConditionUpdated(uint256 indexed id, string newConditionString);

    function createCondition(string calldata conditionString) external {
        Condition storage condition = conditions[length];
        condition.owner = msg.sender;
        condition.conditionString = conditionString;
        emit ConditionCreated(length, conditionString);
        length++;
    }

    function updateCondition(uint256 id, string calldata conditionString) external {
        Condition storage condition = conditions[id];
        require(condition.owner == msg.sender, "Only owner can update condition");
        condition.conditionString = conditionString;
        emit ConditionUpdated(id, conditionString);
    }
}
