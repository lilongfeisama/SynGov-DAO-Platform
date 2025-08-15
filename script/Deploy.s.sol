// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {SynGovToken} from "../src/SynGovToken.sol";
import {SynGovernor} from "../src/SynGovernor.sol";
import "@openzeppelin/contracts/governance/TimelockController.sol";

/// @notice Simple deployment script for SynGov DAO contracts.
contract Deploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address[] memory proposers = new address[](1);
        proposers[0] = vm.envAddress("PROPOSER");
        address[] memory executors = new address[](1);
        executors[0] = vm.envAddress("EXECUTOR");

        vm.startBroadcast(deployerPrivateKey);
        SynGovToken token = new SynGovToken("SynGov Token", "SGT");
        TimelockController timelock = new TimelockController(2 days, proposers, executors, msg.sender);
        SynGovernor governor = new SynGovernor(
            token,
            timelock,
            1 /* voting delay */,
            45818 /* voting period ~1 week */, 
            0 /* proposal threshold */, 
            4 /* 4% quorum */
        );
        vm.stopBroadcast();
    }
}
