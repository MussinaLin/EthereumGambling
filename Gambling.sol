pragma solidity ^0.5.6;

contract Gambling{
    
    address owner;
    
    uint8 ROOM_NUM = 3;
    
    // gambling amount
    string gambling_amount;
    uint256 []guestNum;
    
    mapping(address => uint8) rolling;
    address []users;
    
    
    
    modifier validRoomNum(uint8 roomNum){
        require(roomNum < ROOM_NUM, "invalid room number");
        _;
    }
    
    constructor() public{
        owner = msg.sender;
        guestNum.length = ROOM_NUM;
        gambling_amount = "0.001,0.002,0.003";
        // gambling_amount[0] = "0.001";
        // gambling_amount[1] = "0.002";
        // gambling_amount[2] = "0.003";
    }
    
    function getGamblingAmount() public view returns (string memory){
        return gambling_amount;
    }
    
    function enterRoom(uint8 roomNum) public validRoomNum(roomNum){
        guestNum[roomNum] = guestNum[roomNum] + 1;
        rolling[msg.sender] = uint8(block.number);
        users.push(msg.sender);
    
        // keccak256(blockhash());
        
    }
    
    function getGuestNum(uint8 roomNum)public validRoomNum(roomNum) view returns (uint256){
        return guestNum[roomNum];
    }
    
    function getRollingNum() public view returns(uint8){
        return rolling[msg.sender];
    }
    
    function play() public view returns(string memory){
        if(users.length == 2){
            if(rolling[users[0]] > rolling[users[1]])
                return "user 0 win, ";
            else if(rolling[users[0]] < rolling[users[1]])
                return "user 1 win";
        }
    }
}