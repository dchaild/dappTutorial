// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract RWD {
    string public constant name = 'Reward Token';
    string public constant symbol = 'RWD';
    uint256 public constant decimals = 18;
    uint256 public totalSupply = 1000000000000000000000000 ;// 1 million tokens

    event Transfer(
        address indexed _from, 
        address indexed _to, 
        uint256 _value);

    event Approval(
        address indexed _owner, 
        address indexed _spender, 
        uint256 _value);

        mapping(address => uint256) public balancesof;
        mapping(address => mapping(address => uint256)) public allowance;


        constructor()  {
            balancesof[msg.sender] = totalSupply;
        }

    function transfer( address _to,  uint256 _value) public returns (bool success) {
        require(balancesof[msg.sender] >= _value, "Insufficient balance");
        balancesof[msg.sender] -= _value;
        balancesof[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] += _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

  
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(balancesof[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");
        balancesof[_from] -= _value;
        balancesof[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
        
    }
    