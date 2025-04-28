CXX = clang++

LDFLAGS=-L.
CXXFLAGS=-I. -I./googletest/googletest/include/

test_add: test_add.o libgtest_main.a libgtest.a
	$(CXX) $(LDFLAGS) $^ -o $@

libgtest_main.a libgtest.a &:
	cd ./googletest/googletest/ && \
		mkdir -p build; cd build && \
		cmake .. -DGOOGLETEST_VERSION=1.16.0 -DBUILD_GMOCK=OFF && \
		cmake --build . && \
		cp lib/*.a ../../..

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@

clean:
	rm -rf *.o *.a test_add ./googletest/googletest/build/
