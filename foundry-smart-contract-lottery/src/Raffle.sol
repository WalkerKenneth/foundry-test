// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title Raffle
 * @author  Kenneth Walker
 * @notice This contract is a raffle contract that allows users to buy tickets
 * @dev Implements Chainlink VRF to generate random numbers
 */
contract Raffle {
    /*Errors */
    error NotEnoughEth();

    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    constructor(uint256 _entranceFee) {
        i_entranceFee = _entranceFee;
    }

    function enterRaffle() public payable {
        // require(msg.value >= i_entranceFee, "Not enough ETH to enter the raffle");
        if (msg.value < i_entranceFee) {
            revert NotEnoughEth();
        }
        s_players.push(payable(msg.sender));
    }

    function pickWinner() public {
        // Implement the logic to pick a winner
    }

    /* Getter Functions */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
