// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
    function getPrice()internal view returns (uint256){
        //ABI
        //Address ETH / USD  0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,, )=priceFeed.latestRoundData();
        return uint256(answer * 1e10);
    }
    function getVersion()internal view returns (uint256){
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice=getPrice();
        uint256 ethAmountInUsd=(ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
