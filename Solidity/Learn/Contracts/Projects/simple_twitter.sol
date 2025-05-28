// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract twitter{
    mapping (address => string) public tweets;

    function createTweet(string memory tweetContent)public {
        tweets[msg.sender] = tweetContent;
    }

    function getTweets(address _owner) external view returns (string memory){
        return tweets[_owner];
    }
}
