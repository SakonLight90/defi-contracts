const NodeRegistration = artifacts.require("NodeRegistration");
const AssetLocking = artifacts.require("AssetLocking");
const RewardDistribution = artifacts.require("RewardDistribution");

module.exports = function (deployer) {
    deployer.deploy(NodeRegistration);
    // Sostituire l'indirizzo sottostante con l'indirizzo USDT corretto
    const usdtAddress = "0x..."; 
    deployer.deploy(AssetLocking, usdtAddress);
    deployer.deploy(RewardDistribution);
};
