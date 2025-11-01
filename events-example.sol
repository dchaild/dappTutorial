// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract LearnEvents {
//1. declare the event 2. we want to emit the event
// Only use 3 indexes per event
event NewTrade(
    uint indexed  date,
    address from,
    address indexed to,
    uint256 indexed amount

);

function trade(address to, uint256 amount) external payable {
    emit NewTrade(block.timestamp, msg.sender, to, amount);
}

}