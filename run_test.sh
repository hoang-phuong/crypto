./build_test.sh
./build/bin/test_pcrypto_static >> static_linking.log
./build/bin/test_pcrypto_shared >> dynamic_linking.log
