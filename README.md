# FundMe
Crowdfunding platform on Ethereum. Users contribute ETH to a common pool. Owner can withdraw funds. Requires minimum USD contribution. Uses Chainlink for price conversion. Implements ownership controls. Lacks refund and specific funding goal. Consider security improvements and additional features.

# Features
Minimum funding: Requires a minimum contribution in USD.
Fund contributions: Users can send ETH to the contract.
Fund withdrawal: Owner can withdraw all collected funds.
Ownership: Only the owner can withdraw funds.
Price conversion: Uses Chainlink to convert ETH to USD.
# Usage
Deploy the contract to your desired Ethereum network.
Fund the contract with ETH.
Withdraw funds as the contract owner.
# Limitations
No refund functionality.
No specific funding goal.
Relies on call for withdrawals (consider transfer or send).
# Improvements
Implement refunds.
Add a funding goal.
# License
MIT

# Note: This contract is for demonstration purposes only. Exercise caution when deploying to mainnet.
git clone https://github.com/vasanthmarimuth/FundMe.git
