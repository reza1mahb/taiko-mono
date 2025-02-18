// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @title ITierProvider
/// @notice Defines interface to return tier configuration.
/// @custom:security-contact security@taiko.xyz
interface ITierProvider {
    struct Tier {
        bytes32 verifierName;
        uint96 validityBond;
        uint96 contestBond;
        uint24 cooldownWindow; // in minutes
        uint16 provingWindow; // in minutes
        uint8 maxBlocksToVerifyPerProof;
    }

    error TIER_NOT_FOUND();

    /// @dev Retrieves the configuration for a specified tier.
    /// @param tierId ID of the tier.
    /// @return Tier struct containing the tier's parameters.
    function getTier(uint16 tierId) external view returns (Tier memory);

    /// @dev Retrieves the IDs of all supported tiers.
    /// Note that the core protocol requires the number of tiers to be smaller
    /// than 256. In reality, this number should be much smaller.
    /// @return uint16[] struct containing the ids of the tiers.
    function getTierIds() external view returns (uint16[] memory);

    /// @dev Determines the minimal tier for a block based on a random input.
    /// @param rand (Semi) random number.
    /// @return uint16 Tier id.
    function getMinTier(uint256 rand) external view returns (uint16);
}

/// @dev Tier ID cannot be zero!
library LibTiers {
    uint16 public constant TIER_OPTIMISTIC = 100;
    uint16 public constant TIER_SGX = 200;
    uint16 public constant TIER_SGX_ZKVM = 300;
    uint16 public constant TIER_GUARDIAN = 1000;
}
