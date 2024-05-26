module.exports = {
  networks: {
    // Configurazione per la rete di sviluppo locale Ganache
    development: {
      host: "127.0.0.1",     // Indirizzo IP locale
      port: 8545,            // Porta predefinita di Ganache
      network_id: "*",       // Match qualsiasi network id
    },
  },

  // Impostazioni per compilatore
  compilers: {
    solc: {
      version: "0.8.0",       // Versione del compilatore Solidity
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
  },

  // Directory di default per gli artifacts
  contracts_directory: "./contracts",
  contracts_build_directory: "./build/contracts",

  // Directory di default per le migrazioni
  migrations_directory: "./migrations",
};
