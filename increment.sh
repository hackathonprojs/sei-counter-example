if [ -z "${keyname}" ];
then keyname=admin
fi 
if [ -z "${password}" ];
then password="stupidpassword4hackathon\n"
fi 

seid=~/go/bin/seid
contract='sei16qrzhjcw9p95p5d0n4mnfesyfwp9dg3hz6npd4xlpe8xfu7ce75q3m4hsz' # Fill in contract address from deployment step, ex. sei14hj2tavq8fpesdwxxcu44rty3hh90vhujrvcmstl4zr3txmfvw9sh9m79m

increment_resp=$(printf $password |$seid tx wasm execute $contract '{"increment":{}}' --from $keyname --broadcast-mode=block  --chain-id atlantic-2 --gas=300000 --fees=30000usei -y --node=https://sei-testnet-rpc.polkachu.com/)

#new_count=$($seid q wasm contract-state smart $contract '{"get_count":{}}' | grep -A 1 "count:" | awk -F: '/count:/{getline; print $2}')
#printf "New count: %s\n" "$new_count"