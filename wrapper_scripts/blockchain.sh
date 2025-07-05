#!/bin/bash

# Access websites easily

case "$1" in
  sepolia)
    case "$2" in
      mine)
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
    echo "Usage: $0 <command> [option]"
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