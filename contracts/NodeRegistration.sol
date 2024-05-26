// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NodeRegistration {
    struct Node {
        address owner;
        uint256 contribution;
        bool active;
    }

    address public owner;
    mapping(address => Node) public nodes;

    event NodeRegistered(address indexed nodeOwner);
    event NodeRemoved(address indexed nodeOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerNode() public {
        require(nodes[msg.sender].owner == address(0), "Node already registered");

        nodes[msg.sender] = Node({
            owner: msg.sender,
            contribution: 0,
            active: true
        });

        emit NodeRegistered(msg.sender);
    }

    function updateContribution(address _owner, uint256 _contribution) external onlyOwner {
        require(nodes[_owner].active, "Node is not active");
        nodes[_owner].contribution = _contribution;
    }

    function removeNode(address _nodeOwner) external onlyOwner {
        require(nodes[_nodeOwner].active, "Node is not active or does not exist");

        nodes[_nodeOwner].active = false;
        nodes[_nodeOwner].contribution = 0;

        emit NodeRemoved(_nodeOwner);
    }
}
