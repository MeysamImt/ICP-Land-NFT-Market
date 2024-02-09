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

// export const contractAddress = '0xf9b3c1c7a99796803300d81b7a2a2cf1eb44da26'
export const contractAddress = "0xf9b3c1c7a99796803300d81b7a2a2cf1eb44da26"
