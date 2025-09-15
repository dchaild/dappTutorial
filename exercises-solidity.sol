// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

// create a contract that can store data and return the data back
// 1. Receive information 2. store information and 3. return information back
// Smart contract in the sense of solidity is a collection of code (its functions) and data (state)
// that resides at a specific address on the Ethereum blockchain
// Boolean - keyword: bool - value true/false
// Interger - keyword: unit - value signed and unsigned integers of varying sizes
// String - keyword:  string - data values that are made up ordered sequences of characters

contract simpleStorage {
    //write all the code inside here - functions and its state
     uint storeData; //state variable that will return an integer

     // set and get functions
     function set(uint x) public {
         storeData = x;
         // storeData = storeData + 1;
         // storeData = storeData + x;
         // storeData = x * 10;
         storeData = storeData * 3;
     }

     function get() public view returns (uint) {
         return storeData;
     }
     
     
}