pragma solidity ^0.8.0;

contract DebuggingExample
{
    uint public myUnit;

    function setMyUnit(uint _myUnit)public{
        myUnit += _myUnit;
    }
}