import { Chain } from "wagmi"

export const BITFINITY_CHAIN = {
    id: 355113,
    name: "Bitfinity Network",
    network: "Bitfinity Network",
    nativeCurrency: {
        name: "BitFinity",
        symbol: "BFT",
        decimals: 18,
    },
    rpcUrls: {
        public: { http: ["https://testnet.bitfinity.network"] },
        default: { http: ["https://testnet.bitfinity.network"] },
    },
    //blockExplorerUrls: []
} as const satisfies Chain

// export const contractAddress = '0x6e8d3a3c832b76f5d2844f0830477d74700d0767'
export const contractAddress = "0x6e8d3a3c832b76f5d2844f0830477d74700d0767"
