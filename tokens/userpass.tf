# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

# Enable the userpass authentication method
resource "vault_auth_backend" "userpass" {
  type = "userpass"
  path = local.userpass_path
}

# Userpass is used to create Vault tokens tied to Entity IDs

# Create userpass credentials for users
resource "vault_generic_endpoint" "userpass_user" {
  for_each = local.entity_identifiers

  path = "auth/${vault_auth_backend.userpass.path}/users/${vault_identity_entity_alias.this[each.value].name}"

  data_json = jsonencode({
    password = local.userpass_password
    policies = var.entity_groups[split(":", each.value)[0]]["policies"]
  })
  ignore_absent_fields = true
}
