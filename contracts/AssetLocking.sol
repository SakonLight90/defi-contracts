// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AssetLocking {
    IERC20 public usdtToken;
    mapping(address => uint256) public lockedAssets;

    constructor(address _usdtAddress) {
        usdtToken = IERC20(_usdtAddress);
    }

    function lockAssets(uint256 _amount) public {
        require(usdtToken.transferFrom(msg.sender, address(this), _amount), "Transfer failed");
        lockedAssets[msg.sender] += _amount;
    }

    function unlockAssets(uint256 _amount) public {
        require(lockedAssets[msg.sender] >= _amount, "Insufficient locked assets");
        lockedAssets[msg.sender] -= _amount;
        require(usdtToken.transfer(msg.sender, _amount), "Transfer failed");
    }
}
