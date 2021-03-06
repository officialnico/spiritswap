// SPDX-License-Identifier: MIT
pragma solidity >=0.7.1;

struct DiamondStorage {

    // Used to query if a contract implements an interface.
    // Used to implement ERC-165.
    mapping(bytes4 => bool) supportedInterfaces;

    // maps function selectors to the facets that execute the functions.
    // and maps the selectors to the slot in the selectorSlots array.
    // and maps the selectors to the position in the slot.
    // func selector => address facet, uint64 slotsIndex, uint64 slotIndex
    mapping(bytes4 => bytes32) facets;

    // array of slots of function selectors.
    // each slot holds 8 function selectors.
    mapping(uint => bytes32) selectorSlots;

    // uint128 numSelectorsInSlot, uint128 selectorSlotsLength
    // selectorSlotsLength is the number of 32-byte slots in selectorSlots.
    // selectorSlotLength is the number of selectors in the last slot of
    // selectorSlots.
    uint selectorSlotsLength;        
}

function diamondStorage() pure returns(DiamondStorage storage ds) {
    bytes32 position = keccak256("diamond.standard.diamond.storage");
    assembly { ds.slot := position }
}

