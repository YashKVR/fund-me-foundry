// SDPX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test{
    FundMe fundme;
    function setUp() external{
        fundme = new FundMe();
    }

    function testMinimumDollarIsFive() view public{
        assertEq(fundme.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() view public{
        assertEq(fundme.i_owner(), address(this));
    }

    function testPriceFeedVersionIsAccurate() view public{
        uint256 version = fundme.getVersion();
        assertEq(version,4);
    }
}