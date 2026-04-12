GIT_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "dev")
BRANCH=$(git rev-parse --abbrev-ref HEAD)
COMMIT=$(git rev-parse --short HEAD)

IMAGE_TAG=${GIT_TAG}-${BRANCH}-${COMMIT}

.PHONY:docker
image:
	@echo "开始构建镜像"
	docker build -t audit-frontend:${IMAGE_TAG} .