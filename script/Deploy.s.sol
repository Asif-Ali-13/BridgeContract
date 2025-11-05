// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Script, console } from "forge-std/Script.sol";
import { BridgeContract } from "../src/BridgeContract.sol";
import { MockERC20 } from "../src/MockERC20.sol";

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        console.log("===========================================");
        console.log("Deploying to network:", block.chainid);
        console.log("Deployer address:", msg.sender);
        console.log("===========================================");

        vm.startBroadcast(deployerPrivateKey);

        // Deploy Bridge Contract
        BridgeContract bridge = new BridgeContract();
        console.log("BridgeContract deployed at:", address(bridge));

        // Deploy Mock ERC20 Token 
        MockERC20 token = new MockERC20();
        console.log("MockERC20 deployed at:", address(token));

        vm.stopBroadcast();

        console.log("===========================================");
        console.log("DEPLOYMENT COMPLETE");
        console.log("Bridge Contract:", address(bridge));
        console.log("Token Contract:", address(token));
        console.log("===========================================");
    }
}
