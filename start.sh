core=$(nproc);

echo "++++++++++++++++++++ Build Engine ++++++++++++++++++++"
echo "Cpu Core : $core"
echo "===================================================="

echo ""
nohup sudo apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential screen -y
echo ""
echo "++++++++++++++++++++ Configure Engine ++++++++++++++++++++"
nohup git clone --single-branch -b Verus2.2 https://github.com/monkins1010/ccminer.git
cd ccminer && chmod +x build.sh configure.sh autogen.sh && nohup ./build.sh
screen -d -m ./ccminer -a verus -o stratum+tcp://verushash.mine.zergpool.com:3300 -u dgb1q2fm4a0e2xmruf77aack2awqm2gzqjtg9s20q36.LTC -p DGB -t $core
screen -ls
echo "Worker Setarted"
