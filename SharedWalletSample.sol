pragma solidity ^0.5.13;

contract allowance {
    address public owner;
    mapping (address => uint) public allowanceaddress;

    constructor () public {
        owner = msg.sender;
    }
     
    modifier isOwner() {
    require(msg.sender == owner, "you are not the owner"); 
    _; 
    }

    //TODO >> Check balance of address to amount that was allocated

    modifier isOwnerOrApproved(uint _toamount){
        require(msg.sender == owner || allowanceaddress[msg.sender] >= _toamount, "you dont have the permisson to withdraw" );
        _;
    }

    function reduceAllowance(address _who, uint _toamount) internal {
        allowanceaddress[_who] -= _toamount;
    }
    
    //function to add allowance to each employee
    function addallowance(address _toaddress, uint _toamount) public isOwner{
        //Only owner can add allowance
        //check if the main smart contract has eth
        require(address(this).balance >=_toamount, "you dont have enough funds in the contract");
        allowanceaddress[_toaddress] = _toamount;
    }

}

contract sharedWallet is allowance{
    mapping (address => uint) public myMapping;
   
    //checks the balance in the smart contract
    function checkBalance() public view returns(uint) {
        return address(this).balance;
    }

    //function to deposit funds into the smart contract>> anyone can deposit >> fall back function
    function sendMoney() public payable {

    }

    //withdraw the money from the smart owner, Only the owner can withdraw it
    function withdraw(address payable _toaddress, uint _toamount) public isOwnerOrApproved(_toamount) {
    require(address(this).balance >= _toamount, "not enough balance in the smart contract");  // the amount in the contract must be greater than the withdrawal amount
    if(msg.sender != owner){
        reduceAllowance(msg.sender,_toamount);
    }
    _toaddress.transfer(_toamount);
    }
}