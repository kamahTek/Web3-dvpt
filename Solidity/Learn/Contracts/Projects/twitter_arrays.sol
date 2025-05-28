// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract twitterArrays{
    
    //create a mapping with an array of strings(tweets) of each owner
    mapping (address => string[]) public tweets;

    function createTweet(string memory tweetContent)public {
        tweets[msg.sender].push(tweetContent);
    }

    // Get all of a users Tweets
    function getTweets(address _owner) external view returns (string[] memory){
        return tweets[_owner];
    }

    //Get the tweet by its index
    function singleTweet(address _owner, uint _i) external view returns (string memory){
        return tweets[_owner][_i];
    } 

}