# Copyright (C) 2025 Ioannis Torakis <john.torakis@gmail.com>
# SPDX-License-Identifier: Elastic-2.0
#
# Licensed under the Elastic License 2.0.
# You may obtain a copy of the license at:
# https://www.elastic.co/licensing/elastic-license
#
# Use, modification, and redistribution permitted under the terms of the license,
# except for providing this software as a commercial service or product.

data "http" "authenticate" {
  depends_on = [vault_generic_endpoint.userpass_user]

  for_each = local.entity_identifiers

  url    = "${var.vault_api_url}/auth/${local.userpass_path}/login/${vault_identity_entity_alias.this[each.value].name}"
  method = "POST"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }

  request_body = jsonencode({
    password = local.userpass_password
  })
}

/*
 This will never happen, as the `write_fields` accepts parameters
 available in the `data` part of the response.
 Token Creation has only a `auth` field
*/
/*
resource "vault_generic_endpoint" "authenticate" {
  depends_on = [vault_generic_endpoint.userpass_user]

  for_each = local.entity_identifiers

  path = "/auth/${local.userpass_path}/login/${vault_identity_entity_alias.this[each.value].name}"

  disable_read   = true
  disable_delete = true

  write_fields   = ["auth"]

  data_json = jsonencode({
    password = local.userpass_password
  })
}
*/
