bidsdump pacs lisener parameters:
	AET: BIDSDUMP
	host: bidsdump.robarts.ca
	port: 11116

1. build image:
	docker build -t dcmrcvr .

2. push to docker hub
	docker login
	docker tag dcmrcvr yinglilu/dcmrcvr:0.1
	docker push yinglilu/dcmrcvr:0.1

3.deploy at bidsdump.robarts.ca
	ssh ylu@bidsdump.robarts.ca
	mkdir /bidsdump
	docker pull yinglilu/dcmrcvr:0.1
	docker run --detach --volume /bidsdump:/data --restart=always -p 11116:11116 yinglilu/dcmrcvr:0.1
	note:second term of --volme should be same with the value of ROOTPATH in Dockerfile(ROOTPATH=/data)
	