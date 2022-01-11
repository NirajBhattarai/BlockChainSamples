pragma solidity ^0.8.0;

//
contract ExceptionsExample
{
    mapping(address => uint) public balanceReceived;

    function receiveMoney()   public payable
    {
            balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to,uint _amount)public 
    {
        if(_amount <= balanceReceived[msg.sender])
        {
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }
    }

    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }


}