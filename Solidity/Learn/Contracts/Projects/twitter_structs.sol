// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract twitterStructs{

    uint16 constant MAX_TWEET_LENGTH = 5;

    //create a twitter struct
    struct Tweet {
        address owner;
        string content;
        uint timestamp;  
        uint likes ;  
    }
    
    //create a mapping with an array of strings(tweets) of each owner
    mapping (address => Tweet[]) public tweets;

    function createTweet(string memory tweetContent)public {

        //Require that all of our tweets is less or equal to MAX_TWEET_LENGTH
        require((bytes(tweetContent).length <= MAX_TWEET_LENGTH), "TWEET TOO LOOOONG BROOOOOOO!!!!");

        //Feeding our structs with data
        Tweet memory newTweets = Tweet({
            owner: msg.sender,
            content: tweetContent,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweets);
    }

    // Get all of a users Tweets
    function getTweets(address _owner) external view returns (Tweet[] memory){
        return tweets[_owner];
    }

    //Get the tweet by its index
    function singleTweet(address _owner, uint _i) external view returns (Tweet memory){
        return tweets[_owner][_i];
    } 

}