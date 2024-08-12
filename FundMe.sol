// get fund from user
// withdraw funds
// set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "fundme/PriceConverter.sol";

error NotOwner();

contract FundMe{
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;
    address[] public funders;
    mapping(address => uint256) public  addresstoAmountFunded;

    address public immutable i_owner;
    constructor(){
        i_owner = msg.sender;
    }

    function fund()public payable{
        require(msg.value.getConversionRate()>=MINIMUM_USD,"didn't enough to send");
        funders.push(msg.sender);
        addresstoAmountFunded[msg.sender]+=msg.value;
    }
    function withdraw()public onlyOwner{
       

        for(uint256 funderindex=0;funderindex<funders.length;funderindex++){
            address funder=funders[funderindex];
            addresstoAmountFunded[funder]=0;
        }
        //reset the array
        funders=new address[](0);

        // //send using three ways

        // //transfer
        // payable(msg.sender).transfer(address(this).balance);

        // //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess,"Sent Failed");

        //call 
        (bool callSuccess ,)=payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"call failed");
    }

    modifier onlyOwner{
        //  require(msg.sender == i_owner ,"sender is not a owner");
        if(msg.sender==i_owner){
            revert NotOwner();
        }
         _;
    }

    receive() external payable { 
        fund();
    }
    fallback() external payable {
        fund();
     }
    
}

