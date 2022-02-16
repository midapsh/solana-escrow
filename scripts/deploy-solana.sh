#!/usr/bin/env bash
cargo build-bpf
PATH_TO_PROGRAM=$(pwd)/target/deploy/solana_escrow.so
solana program deploy $PATH_TO_PROGRAM