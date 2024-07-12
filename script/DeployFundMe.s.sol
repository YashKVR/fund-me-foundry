// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script{
    function run() external returns (FundMe) {
        //Done before broadcast to avaoid paying gas.
        //Before Broadcast -> Not a real tx
        HelperConfig helperConfig = new HelperConfig();
        // (address ethUsdPriceFeed, , , ) = helperConfig.activeNetworkConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        //After bradcast -> real tx!
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();

        return fundMe;
    }
}