pragma solidity ^0.8.30;

import {ERC20} from "@openzeppelin/token/ERC20/ERC20.sol"; 

contract Token is ERC20{
    constructor () ERC20 ("Token", "TOKEN"){
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}