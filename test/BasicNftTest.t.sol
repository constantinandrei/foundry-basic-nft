// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    DeployBasicNft public s_deployBasicNft;
    BasicNft public s_basicNft;
    address public USER = makeAddr("user");
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        s_deployBasicNft = new DeployBasicNft();
        s_basicNft = s_deployBasicNft.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = s_basicNft.name();
        assert(
            keccak256(abi.encodePacked(actualName)) ==
                keccak256(abi.encodePacked(expectedName))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        s_basicNft.mintNft(PUG_URI);
        uint256 expectedBalance = 1;
        uint256 actualBalance = s_basicNft.balanceOf(USER);
        assert(actualBalance == expectedBalance);
        assert(keccak256(abi.encodePacked(s_basicNft.tokenURI(0))) == keccak256(abi.encodePacked(PUG_URI)));
    }
}
