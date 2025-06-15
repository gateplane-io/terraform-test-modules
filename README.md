# Terraform Test Modules
Terraform modules used for E2E testing of the Plugins

![License: ElasticV2](https://img.shields.io/badge/ElasticV2-green?style=flat-square&label=license&cacheSeconds=3600&link=https%3A%2F%2Fwww.elastic.co%2Flicensing%2Felastic-license)

The terraform modules provided are:
* [`./tokens`](./tokens): Creates Vault/OpenBao Entities, authenticates them using userpass backend and outputs tokens.
* [`./gateplane-mock`](./gateplane-mock): Mounts the [`mock` plugin](https://github.com/gateplane-io/vault-plugins/tree/main/cmd/mock), that provides all approval-based functionality for testing.


---

## License

This project is licensed under the [Elastic License v2](https://www.elastic.co/licensing/elastic-license).

This means:

- ✅ You can use, fork, and modify it for **yourself** or **within your company**.
- ✅ You can submit pull requests and redistribute modified versions (with the license attached).
- ❌ You may **not** sell it, offer it as a paid product, or use it in a hosted service (e.g., SaaS).
- ❌ You may **not** re-license it under a different license.

In short: You can use and extend the code freely, privately or inside your business - just don’t build a business around it without our permission.
[This FAQ by Elastic](https://www.elastic.co/licensing/elastic-license/faq) greatly summarizes things.

See the [`./LICENSES/Elastic-2.0.txt`](./LICENSES/Elastic-2.0.txt) file for full details.
