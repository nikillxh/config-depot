#!/bin/bash

# Access websites easily

# Import variables
VAR_FILE="variables.json"

case "$1" in
  sepolia)
    case "$2" in
      mine)
        echo "$(jq -r '.eth_testnutter' $VAR_FILE)" | xclip -selection clipboard
        xdg-open https://sepolia-faucet.pk910.de/
        ;;
      scan)
        xdg-open https://sepolia.etherscan.io/
        ;;
      google)
        xdg-open https://cloud.google.com/application/web3/faucet/ethereum/sepolia
        ;;
      -h|help)
        echo "Usage: $0 sepolia [mine|scan|google]"
        echo "  mine    - Mine Sepolia faucet"
        echo "  scan    - Sepolia Etherscan"
        echo "  google  - Google Sepolia faucet"
        ;;
      *)
        echo "Enter -h for help"
        ;;
    esac
  ;;
  -h)
    echo "Usage: blockchain.sh <command> [option]"
    echo "Commands:"
    echo "> sepolia -> Open faucet, scan or google faucet"
    echo "   mine   - Mine Sepolia faucet"
    echo "   scan   - Sepolia Etherscan"
    echo "   google - Google Cloud Faucet"
  ;;
  *)
    echo "Enter -h for help"
    ;;
esac