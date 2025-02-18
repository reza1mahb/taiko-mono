// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @title IAddressManager
/// @notice Manages a mapping of (chainId, name) pairs to Ethereum addresses.
/// @custom:security-contact security@taiko.xyz
interface IAddressManager {
    /// @notice Gets the address mapped to a specific chainId-name pair.
    /// @dev Note that in production, this method shall be a pure function
    /// without any storage access.
    /// @param chainId The chainId for which the address needs to be fetched.
    /// @param name The name for which the address needs to be fetched.
    /// @return Address associated with the chainId-name pair.
    function getAddress(uint64 chainId, bytes32 name) external view returns (address);
}
