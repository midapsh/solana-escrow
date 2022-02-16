### Environment Setup
1. Install Rust from https://rustup.rs/
2. Install Solana from https://docs.solana.com/cli/install-solana-cli-tools#use-solanas-install-tool

### Build and test for program compiled natively
```
$ cargo build
$ cargo test
```

### Build and test the program compiled for BPF
```
$ cargo build-bpf
$ cargo test-bpf
```

### How to create a wallet

My UI requires a private key (NEVER DO THIS IN A REAL APP). Go to [sollet.io](https://www.sollet.io/#) and create an entirely new account or a new account next to your main account. This account will represent Alice.

Change the sollet cluster to localnet.

After creating the wallet, airdrop yourself some SOL to pay for the tx fees. Then, click on your SOL account in the middle of the screen and then on export to export your private key byte array and paste it above.

Use your throwaway wallet for the next steps as well.

### Creating tokens for testing on localnet
You'll also need a token to put into the escrow so head over to the [SPL Token UI](https://www.spl-token-ui.com/#/). Make sure you choose *localnet* here too.

During the next steps, you will create the token mint accounts for X and Y and 2 token accounts, Alice's X and Alice's Y account. After creating each token account (not the token mint account!), copy the account address and put it into the appropriate UI field. You could also write them down somewhere else so can reuse them when eventually testing the entire escrow, including Bob's transaction.

Start by heading over to `Create new token` inside the `Tokens` tab. Fill out the mint authority with your sollet pubkey and create the new token. Keep in mind, this is the token mint account for token X, i.e. the account that holds all the metadata of the token e.g. its supply and who is allowed to mint it (if you set the mint authority correctly, that should be your sollet pubkey! You can verify this in the explorer).

Next, go to `Create account` inside the `Accounts` tab and fill in the address of the token you just created and use your sollet pubkey as the account owner. Create an account (doesn't matter whether it's associated or not). This is Alice's token X token account.

Then, go to `Edit account` inside the `Accounts` tab. The `mint` option is selected by default. Put in Alice's token X token account (the one you just created) as the destination account and some number in the amount field. Click `Mint to account`.

Go through the same steps for token Y. You don't have to mint tokens to Alice's token Y account.

