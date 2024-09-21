// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./PERC20.sol";

contract PERC20Sample is PERC20 {
    constructor() PERC20("f9bb5c64fb5a4e79c3d4b99f7deb8ff2a32800da1849ea72e9b5e38f19e2b4d3", "f9bb5c64fb5a4e79c3d4b99f7deb8ff2a32800da1849ea72e9b5e38f19e2b4d3") {}

    function mint100tokens() public {
        _mint(msg.sender, 100*10**18);
    }

    function balanceOf(address account) public view override returns (uint256) {
        require(msg.sender == account, "PERC20Sample: msg.sender != account");

        return _balances[account];
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        require(msg.sender == spender, "PERC20Sample: msg.sender != account");
        
        return _allowances[owner][spender];
    }
}
