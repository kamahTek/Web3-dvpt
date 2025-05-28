// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract twitterModifiers{

    uint16 public MAX_TWEET_LENGTH = 5;

    //create a twitter struct
    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint timestamp;  
        uint likes ;  
    }
    
    //create a mapping with an array of strings(tweets) of each owner
    mapping (address => Tweet[]) public tweets;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "YOU ARE NOT THE OWNER");
        _;
    }

    function createTweet(string memory tweetContent)public {

        //Require that all of our tweets is less or equal to MAX_TWEET_LENGTH
        require((bytes(tweetContent).length <= MAX_TWEET_LENGTH), "TWEET TOO LOOOONG BROOOOOOO!!!!");

        //Feeding our structs with data
        Tweet memory newTweets = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: tweetContent,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweets);
    }

    function likeTweet(address _owner, uint _id) public{
        require(tweets[_owner][_id].id == _id,"INVALID TWEET INDEX");
        
        //Increase the like of a tweet
        tweets[msg.sender][_id].likes++;
    }

    function unlikeTweet(address _owner, uint _id) public{
        require(tweets[_owner][_id].id == _id,"INVALID TWEET INDEX");
        require(tweets[_owner][_id].likes > 0,"TWEET HAS NO LIKES");
        
        //Increase the like of a tweet
        tweets[msg.sender][_id].likes--;
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner{
        MAX_TWEET_LENGTH = newTweetLength;
    }

    // Get all of a users Tweets
    function getTweets(address _author) external view returns (Tweet[] memory){
        return tweets[_author];
    }
    
    //Get the tweet by its index
    function singleTweet(address _author, uint _i) external view returns (Tweet memory){
        return tweets[_author][_i];
    } 

}