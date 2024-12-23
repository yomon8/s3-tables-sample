TF_CMD := terraform
TF_DIR_BASE := ./terraform
TF_DIR_AWS := $(TF_DIR_BASE)/aws
TF_VARS_DIR :=  ../..
TF_VARS_BACKEND := $(TF_VARS_DIR)/env.tfvars
TF_VARS_ARGS := -var-file $(TF_VARS_BACKEND)
TF_BACKEND_ARGS := -backend-config $(TF_VARS_BACKEND)

.PHONY: tf-init
tf-init: ## Initialize terraform
	$(TF_CMD) -chdir=$(TF_DIR_AWS) init -reconfigure -upgrade $(TF_BACKEND_ARGS)

.PHONY: tf-apply
tf-apply: tf-init ## Apply terraform
	$(TF_CMD) -chdir=$(TF_DIR_AWS) apply $(TF_VARS_ARGS)

.PHONY: tf-destroy
tf-destroy: tf-init ## Destroy terraform
	$(TF_CMD) -chdir=$(TF_DIR_AWS) destroy $(TF_VARS_ARGS)

.PHONY: help
.DEFAULT_GOAL := help
help: ## HELP表示 
	@grep --no-filename -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'