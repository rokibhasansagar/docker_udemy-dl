BUILDX_VER=v0.3.0
IMAGE_NAME=udemy-dl
TAG?=latest
VER='1.1'

install:
	mkdir -vp ~/.docker/cli-plugins/ ~/dockercache
	curl --silent -L "https://github.com/docker/buildx/releases/download/${BUILDX_VER}/buildx-${BUILDX_VER}.linux-amd64" > ~/.docker/cli-plugins/docker-buildx
	chmod a+x ~/.docker/cli-plugins/docker-buildx

prepare: install
	docker buildx create --use --platform linux/amd64,linux/386,linux/arm64/v8,linux/arm/v7,linux/arm/v6,linux/ppc64le,linux/s390x
	docker buildx inspect --bootstrap

prepare-old: install
	docker context create old-style
	docker buildx create old-style --use --platform linux/amd64,linux/386,linux/arm64/v8,linux/arm/v7,linux/arm/v6,linux/ppc64le,linux/s390x
	docker buildx inspect --bootstrap

build-push:
	docker buildx build --compress --no-cache --rm --force-rm --push \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%S%Z"` \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
		--build-arg VCS_URL=`git remote get-url origin` \
		--build-arg VERSION=${VER} \
		--platform linux/amd64,linux/386 \
		-t ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG} .

build-push-all:
	docker buildx build --compress --no-cache --rm --force-rm --push \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%S%Z"` \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
		--build-arg VCS_URL=`git remote get-url origin` \
		--build-arg VERSION=${VER} \
		--platform linux/amd64,linux/386,linux/arm64/v8,linux/arm/v7,linux/arm/v6,linux/ppc64le,linux/s390x \
		-t ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG} .

test:
	docker buildx imagetools inspect ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}

ping:
	curl -X POST "https://hooks.microbadger.com/images/fr3akyphantom/udemy-dl/-iWYhKSpcpCCAtGre_aaXxtCCfc=" && echo ""
