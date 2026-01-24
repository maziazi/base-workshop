pragma solidity ^0.8.30;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";

// RUN TEST
// forge test --vvv (untuk melihat detail console log)
// forge test --match-contract namaFile (untuk menjalankan test pada contract tertentu saja)
// forge test --match-test namaFunction (untuk menjalankan test pada function tertentu saja)

contract TokenTest is Test {
    Token public token;

    address alice  = makeAddr("alice");
    address bob    = makeAddr("bob");

    function setUp() public {
        token = new Token();
        console.log ("alice address:", alice);
        console.log ("bob address:", bob);
    }

// Ketika isian pada assertEq salah, maka akan muncul pesan error di console. Isian harus sama seperti di Cons
    function testName() public {
        assertEq(token.name(), "Maziazi");
    }

    function testSymbol() public {
        assertEq(token.symbol(), "MAZI");
    }

    function testDecimals() public {
        assertEq(token.decimals(), 21);
    }

    function testMint() public {
        token.mint(alice, 1e21);
        assertEq(token.balanceOf(alice), 1e21);
    }

// Di function burn tetap perlu ada mint terlebih dahulu agar saldo mencukupi untuk di burn
// nilai token tidak boleh minus
    function testBurn() public {
        token.mint(alice, 1e21);
        token.burn(alice, 1e21);
        assertEq(token.balanceOf(alice), 0);
    }

    function testTransfer() public {
        // Alice punya duit 1000 $MAZI
        // bob punya duit 0 $MAZI
        // Alice transfer 500 $MAZI ke Bob

        token.mint(alice, 1000e21);

        console.log("Before transfer:");
        console.log("Alice balance:", token.balanceOf(alice));
        console.log("Bob balance:", token.balanceOf(bob));

        vm.startPrank(alice);
        token.transfer(bob, 500e21);
        vm.stopPrank();

        console.log("After transfer:");
        console.log("Alice balance:", token.balanceOf(alice));
        console.log("Bob balance:", token.balanceOf(bob));
    }
}