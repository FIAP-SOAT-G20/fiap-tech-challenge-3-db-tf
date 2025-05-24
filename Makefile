# Looks at comments using ## on targets and uses them to produce a help output.
.PHONY: help
help: ALIGN=22
help: ## Print this message
	@echo "Usage: make <command>"
	@awk -F '::? .*## ' -- "/^[^':]+::? .*## /"' { printf "  make '$$(tput bold)'%-$(ALIGN)s'$$(tput sgr0)' - %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

.PHONY: tf-init
tf-init: ## Initialize Terraform
	@echo  "🟢 Initializing Terraform..."
	terraform init

.PHONY: tf-plan
tf-plan: ## Show Terraform plan
	@echo  "🟢 Showing Terraform plan..."
	terraform plan

.PHONY: tf-apply
tf-apply: ## Apply Terraform
	@echo  "🟢 Applying Terraform..."
	terraform apply -auto-approve
