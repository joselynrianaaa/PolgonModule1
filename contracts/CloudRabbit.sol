// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract CloudRabbit is ERC721A {
    address public owner;

    uint256 public max = 5;

    string baseUrl =
        "https://brown-acceptable-caribou-894.mypinata.cloud/ipfs/QmRCuA2jKvhu1tBQiupwTRBRRSY9vUXwXAhLUyAh8tsxcP/";

    string public prompt = "Rabbit eating clouds";

    constructor() ERC721A("CloudRabbit", "CR") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function mint(uint256 quantity) external payable onlyOwner {
        require(
            totalSupply() + quantity <= max,
            "5 is maximum that you can mint"
        );
        _mint(msg.sender, quantity);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}