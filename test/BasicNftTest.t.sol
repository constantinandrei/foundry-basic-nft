// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    DeployBasicNft public s_deployBasicNft;
    BasicNft public s_basicNft;
    function setUp() public {
        s_deployBasicNft = new DeployBasicNft();
        s_basicNft = s_deployBasicNft.run();
    }
}