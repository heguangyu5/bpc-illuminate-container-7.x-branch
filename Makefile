libilluminate-container.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Illuminate libilluminate-container

libilluminate-container:
	bpc -v \
		-c bpc.conf  \
		-l illuminate-container \
		-u psr-container        \
		-u illuminate-contracts \
		--input-file src.list

install-libilluminate-container:
	cd Illuminate && bpc -l illuminate-container --install
