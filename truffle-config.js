module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "5777"
    },
    // Add other network configurations if needed
  },
  compilers: {
    solc: {
      version: "0.8.18",
    }
  },
};
