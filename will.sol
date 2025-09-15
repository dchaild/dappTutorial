// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Will {
    address owner;
    uint    fortune;
    bool    graduated;

    constructor() payable  {
        owner = payable (msg.sender); // represents address that is being called
        fortune = msg.value; //tells us much is being sent
        graduated = false;
    }

    // create modifier so the only person who can call the contract is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can transer");
        _;
    }


    // create modifire so the we only allocate funds if friends daugther grauated
    modifier onlyGraduated() {
        require(graduated, "Not graduated"); 
        _;
    }

    address payable [] familyWallets;

    mapping (address => uint) public rewards;

    // set reward for each addresss

    function setRewards ( address payable wallet, uint amount) public onlyOwner {
        familyWallets.push(wallet);
        rewards[wallet] = amount;

    }

    // oracle simulated switch
       function setGraduated(bool _graduated) public onlyOwner {
        graduated = _graduated;
        payout();
    }
    // Pay each family member based on their wallet

    function payout() private onlyGraduated {
        // with a for loop
        for(uint i=0; i<familyWallets.length; i++) {
            familyWallets[i].transfer(rewards[familyWallets[i]]);
            // 1. get the wallet address
            // 2. get the reward amount
            // 3. send the reward amount to the wallet address
        }

    }





}