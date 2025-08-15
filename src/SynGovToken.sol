// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

/// @title SynGovToken - Governance token with voting power.
/// @notice This token extends ERC20Votes to enable delegation-based voting.
contract SynGovToken is ERC20Votes {
    constructor(string memory name, string memory symbol)
        ERC20(name, symbol)
        ERC20Permit(name)
    {}

    /// @notice Mints tokens to an address. Only for demonstration.
    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
