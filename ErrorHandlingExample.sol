pragma solidity ^0.8.0;

/**
 require() and assert() are condition based where revert() explicitly used in conditions to revert error message.
 
 Gas:
 ------------
 1.require() do not consume all gas if error occurs
 2.assert() consumes all remaining gas 
 3.revert() do not consume all gas if error occurs

*/
contract ErrorHandlingExample
{

    uint public value;
    
    function testRequire(uint inputValue)public returns(string memory)
    {
         require(inputValue > 10,"input is invalid");
         value = inputValue;//This statement get executed If inputValue greaterthan 10
    }

    function testRevert(uint inputValue)public  returns(string memory)
    {
        if(inputValue < 10)
        revert("input is invalid ");
        value = inputValue;//This statement did not execute If inputValue lessthan 10
    }

    function testAssert(uint inputValue)public returns(string memory)
    {
        assert(inputValue !=0);
        value = inputValue;//This statement never executes if assert() results false 
    }



}