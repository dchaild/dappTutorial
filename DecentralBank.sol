// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./RWD.sol";
import "./tether.sol";

contract DecentralBank {
    
    string public name  = "Decentral Bank";
    address public owner;
    RWD public rwd;
    Tether public tether;


constructor (RWD _rwd, Tether _tether )  {
   // owner = msg.sender;
    rwd = _rwd;
    tether = _tether;

}

    
}