./build_test.sh
./build/bin/test_pcrypto_static >> static_linking.log 2>&1
./build/bin/test_pcrypto_shared >> dynamic_linking.log 2>&1
