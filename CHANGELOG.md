# Changelog

All notable changes to this project will be documented in this file.

## [3.3.0](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.2.1...v3.3.0) (2022-01-28)


### Features

* Added support for redrive_allow_policy ([#35](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/35)) ([5f86cc1](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/5f86cc17703b31ace643a75f0d3ad5b4da7159ce))

## [3.2.1](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.2.0...v3.2.1) (2021-11-23)


### Bug Fixes

* update CI/CD process to enable auto-release worfklow ([#33](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/33)) ([4259563](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/4259563e7e5b498bf4f8106da0bec1771784b3f0))

<a name="v3.2.0"></a>
## [v3.2.0] - 2021-11-22

- feat: Added support for `deduplication_scope` and `fifo_throughput_limit` ([#32](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/32))


<a name="v3.1.0"></a>
## [v3.1.0] - 2021-05-26

- fix: Extend example with custom policy ([#30](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/30))
- chore: Fix link to complete example in docs ([#29](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/29))
- chore: update CI/CD to use stable `terraform-docs` release artifact and discoverable Apache2.0 license ([#28](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/28))


<a name="v3.0.0"></a>
## [v3.0.0] - 2021-04-26

- feat: Shorten outputs (removing this_) ([#27](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/27))
- chore: update documentation and pin `terraform_docs` version to avoid future changes ([#26](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/26))
- chore: align ci-cd static checks to use individual minimum Terraform versions ([#25](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/25))
- chore: add ci-cd workflow for pre-commit checks ([#24](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/24))
- chore: add examples validation ci/cd workflow ([#22](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/22))
- chore: update documentation based on latest `terraform-docs` which includes module and resource sections ([#23](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/23))
- chore: update pre-commit hooks and documentation; add versions; add ci-cd workflow for pre-commit checks ([#21](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/21))


<a name="v2.1.0"></a>
## [v2.1.0] - 2020-03-30

- feat: Add SQS name to the outputs ([#17](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/17))


<a name="v2.0.0"></a>
## [v2.0.0] - 2019-06-12

- Upgraded module to support Terraform 0.12 ([#6](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/6))


<a name="v1.2.1"></a>
## [v1.2.1] - 2018-06-05

- Create SQS queues correctly (fixes [#4](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/4))


<a name="v1.2.0"></a>
## [v1.2.0] - 2018-06-04

- Fix usage of KMS key in count


<a name="v1.1.0"></a>
## [v1.1.0] - 2018-05-16

- Added pre-commit hook to autogenerate terraform-docs


<a name="v1.0.0"></a>
## [v1.0.0] - 2018-02-23

- Fixed conditional creation rule
- Changed default value for content_based_deduplication to false
- Fixed styling
- Added sqs module


<a name="v0.0.2"></a>
## [v0.0.2] - 2017-09-26



<a name="v0.0.1"></a>
## v0.0.1 - 2017-09-26

- Initial commit
- Initial commit


[Unreleased]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.2.0...HEAD
[v3.2.0]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.1.0...v3.2.0
[v3.1.0]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.0.0...v3.1.0
[v3.0.0]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v2.1.0...v3.0.0
[v2.1.0]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v2.0.0...v2.1.0
[v2.0.0]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v1.2.1...v2.0.0
[v1.2.1]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v1.2.0...v1.2.1
[v1.2.0]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v1.1.0...v1.2.0
[v1.1.0]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v1.0.0...v1.1.0
[v1.0.0]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v0.0.2...v1.0.0
[v0.0.2]: https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v0.0.1...v0.0.2
