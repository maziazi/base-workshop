pragma solidity ^0.8.30;

import {ERC20} from "@openzeppelin/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/access/Ownable.sol";

contract Token is ERC20, Ownable {
    error ERC20ExceedsMaxMintAmmount(uint256 amount);
    // constructor () ERC20 ("Token", "TOKEN"){
    //     _mint(msg.sender, 1000000 * 10 ** decimals());
    // }

//Constructor = functions. Constructor adalah function yang akan dijalankan pertama kali saat contract di deploy
    constructor () ERC20 ("Maziazi", "MAZI") Ownable(msg.sender){}

// Mint to create tokens 
    modifier maxMint (uint256 _amount) {
        if (_amount > 1_000e21) revert ERC20ExceedsMaxMintAmmount(_amount);
        _;
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
    
// Burn to destroy tokens
    function burn(address from, uint256 amount) external {
        _burn(from, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 21;
    }

// function _NamaFunction() _public/_private/_internal/_external _view/_pure/_override returns (tipe data)
}