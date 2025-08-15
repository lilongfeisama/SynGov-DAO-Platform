// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/SynGovToken.sol";
import "../src/SynGovernor.sol";
import "@openzeppelin/contracts/governance/TimelockController.sol";

contract SynGovTest is Test {
    SynGovToken token;
    TimelockController timelock;
    SynGovernor governor;

    function setUp() public {
        token = new SynGovToken("SynGov Token", "SGT");
        address[] memory proposers = new address[](1);
        proposers[0] = address(this);
        address[] memory executors = new address[](1);
        executors[0] = address(this);
        timelock = new TimelockController(2 days, proposers, executors, address(this));
        governor = new SynGovernor(token, timelock, 1, 45818, 0, 4);
    }

    function testMint() public {
        token.mint(address(this), 100e18);
        assertEq(token.totalSupply(), 100e18);
    }
}
