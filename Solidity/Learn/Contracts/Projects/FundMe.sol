// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe{

    uint256 private constant FUNDAMOUNT = 2 * 1e18;

    address public owner;

    // array of funder address
    address[] public funder;

    // map each funder address to their contribution
    mapping(address => uint256) public funder_contributions;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
         require(msg.sender == owner,"NO FUNDS AVAILABLE"); // play with psychology of a hacker
         _; // allows the contract to continue executing this code after _ is executed
    }

    function fund() public payable  {
        // Allow users to send $
        //Have minimum $ sent
        require(msg.value >= FUNDAMOUNT,"NOT ENOUGH ETH"); // 1e18 wei = 1 ETH
    
        // Add the address of funders to our mapping (array) funder and add their contribution
        funder_contributions[msg.sender] += msg.value;

        // add the funder address to our array 
        funder.push(msg.sender);

    }

    function withdraw() public onlyOwner{
        // reset the mapping to zero using a for loop
        for(uint256 funderIndex = 0; funderIndex < funder.length; funderIndex++){
            address funderAddress = funder[funderIndex];
            funder_contributions[funderAddress] = 0;
        }

        // reset fund address array to zero
        // delete funder;
        funder = new address[](0);

        // withdraw all payments -> 3 methods
        // transfer
        //payable(msg.sender).transfer(address(this).balance)
        // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Failed to send Ether");

        // call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Failed");
    }

    //When you send eth directly without calling the fund function -> we can still process the transaction

    fallback() external{
        fund();
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable{
        fund();
    }

}