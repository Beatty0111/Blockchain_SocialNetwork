pragma solidity ^0.4.0;

// Test MasterNode
contract MasterNode {
    
    mapping(address => TweetAccount) userAccounts;
    
    /*
    address random = 0x9ed3e9a938b2b29Cfc1e8fA98D1919dc730d0841;
    
    function test() public {
        TweetAccount joe = new TweetAccount("joe");
        userAccounts[random] = joe;
        userAccounts[random].addFollow(joe);
    }
    */
    
    function addTweet(string value) public {
        if(userAccounts[msg.sender] == TweetAccount(0)) {
            userAccounts[msg.sender] = new TweetAccount("Default Name");
        }
        userAccounts[msg.sender].createTweet(value);
    }
    
    function getFollowing(uint256 index) public constant returns (address followings) {
        if(userAccounts[msg.sender] > TweetAccount(0)) {
            return userAccounts[msg.sender]._following(index);
        }
        return TweetAccount(0);
    }
    
    function getFollowing(uint256 index, address userAddr) public constant returns (address followings) {
        if(userAccounts[userAddr] > TweetAccount(0)) {
            return userAccounts[userAddr]._following(index);
        }
        return TweetAccount(0);
    }
    
    function removeFollowing(address followAccount) public {
        if(userAccounts[followAccount] > TweetAccount(0)) {
            if(userAccounts[msg.sender] > TweetAccount(0)) {
                userAccounts[msg.sender].removeFollow(followAccount);
            }
        }
    }
    
    function addFollowing(address followAccount) public {
        if(userAccounts[followAccount] > TweetAccount(0)) {
            if(userAccounts[msg.sender] == TweetAccount(0)) {
                userAccounts[msg.sender] = new TweetAccount("Default Name");
            }
            userAccounts[msg.sender].addFollow(followAccount);
        }
    }
    
    function getLastTweet(address userAddr) public constant returns (Tweet tweet) {
        if(userAccounts[userAddr] > TweetAccount(0)) {
            return userAccounts[userAddr]._lastTweet();
        }
        return Tweet(0);
    }
    
    function getAcctName(address userAddr) public constant returns (string name) {
        if(userAccounts[userAddr] > TweetAccount(0)) {
            return userAccounts[userAddr]._name();
        }
        return "";
    }
}

//----------------------------------------------------------------------------------------------------------------------------------
// Contract for TweetAccounts (duhh)
contract TweetAccount {
    
    address[] public _following;
    string public _name;
    Tweet public _lastTweet;
    
    constructor(string name) public{
        _name = name;
    }
    
    // Adds specified user address to following list
    function addFollow(address followAddress) public {
        _following.push(followAddress);
    }
    
    
    // Loops through following list to find address of specified user.
    // Replaces used with last user in list and deletes last user. (if not last user already)
    function removeFollow(address followAddress) public {
        
        for(uint i = 0; i < _following.length; ++i){
            
            if(_following[i] == followAddress){
                
                _following[i] = _following[_following.length - 1];
                delete _following[_following.length - 1];
                break;
            }
        }
    }
    
    function createTweet(string tweet) public {
        Tweet newTweet = new Tweet(tweet, _lastTweet);
        _lastTweet = newTweet;
        
    }
}

//----------------------------------------------------------------------------------------------------------------------------------
contract Tweet {
   Tweet public _lastTweet;
   string public _value;

   constructor(string value, Tweet lastTweet) public {
       _value = value;
       _lastTweet = lastTweet;
   }
}