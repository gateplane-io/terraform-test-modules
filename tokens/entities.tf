# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

resource "vault_identity_entity" "this" {
  for_each = local.entity_identifiers

  name     = "${split(":", each.value)[0]}-${split(":", each.value)[1]}"
  policies = var.entity_groups[split(":", each.value)[0]]["policies"]

  metadata = {
    // TODO: add in var.entity_groups maps
  }
}

# Create an alias for the first entity for the userpass auth method
resource "vault_identity_entity_alias" "this" {
  for_each = local.entity_identifiers

  name           = vault_identity_entity.this[each.value].name
  canonical_id   = vault_identity_entity.this[each.value].id
  mount_accessor = vault_auth_backend.userpass.accessor
}
