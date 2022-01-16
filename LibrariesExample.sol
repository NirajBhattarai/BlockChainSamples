pragma solidity ^0.8.0;

//Import statement to import SafeMath smartcontract
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";


/**
     * This simple smartcontrcat will help you to understand how to use safeMath smartcontract from OpenZeppelin.
     * Compiler version 8.0 is not required using safeMath for overflow checking in arithmetic operations.
     * Requirements:
     *
     * How to use libraries in smartcontracts
     */


contract LibrariesExample
{
    //using statement for SafeMath
    using SafeMath for uint256;
    //unsigned integer variable declaration to capture result 
    uint256 public result;

   
    function  testMultiply(uint256 _a,uint256 _b)public  returns(uint256) 
    {
        result = SafeMath.mul(_a,_b);
        return result;
    }

    function  testAddition(uint256 _a,uint256 _b)public  returns(uint256) 
    {
        result = SafeMath.add(_a,_b);
        return result;
    }

     function  testDivision(uint256 _a,uint256 _b)public  returns(uint256) 
    {
        result = SafeMath.div(_a,_b);
        return result;
    }

    function  testSubtraction(uint256 _a,uint256 _b)public  returns(uint256) 
    {
        result = SafeMath.sub(_a,_b);
        return result;
    }

    function  testModulo(uint256 _a,uint256 _b)public  returns(uint256) 
    {
        result = SafeMath.mod(_a,_b);
        return result;
    }



}