// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RewardDistribution {
    mapping(address => uint256) public rewards;

    function distributeRewards(address[] memory _nodes, uint256[] memory _contributions) public {
        require(_nodes.length == _contributions.length, "Array length mismatch");

        uint256 totalContribution;
        for (uint256 i = 0; i < _contributions.length; i++) {
            totalContribution += _contributions[i];
        }

        for (uint256 i = 0; i < _nodes.length; i++) {
            rewards[_nodes[i]] = (_contributions[i] * 100) / totalContribution;
        }
    }
}
