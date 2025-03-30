# Changelog

All notable changes to this project will be documented in this file.

## [4.3.0](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v4.2.1...v4.3.0) (2025-03-30)


### Features

* Add support for customizing DLQ FIFO throughput limit ([#70](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/70)) ([59f2551](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/59f2551f09058689291543f8be96453aeeab4973))

## [4.2.1](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v4.2.0...v4.2.1) (2024-10-11)


### Bug Fixes

* Update CI workflow versions to latest ([#65](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/65)) ([62bbf21](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/62bbf21af92f39755aa864fda28b771328bcc5c5))

## [4.2.0](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v4.1.1...v4.2.0) (2024-04-26)


### Features

* Added queue_arn_static and dead_letter_queue_arn_static outputs ([#62](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/62)) ([cd54bb0](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/cd54bb0737280c6b3f93be5ca12d69906fa3a9f7))

## [4.1.1](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v4.1.0...v4.1.1) (2024-03-06)


### Bug Fixes

* Update CI workflow versions to remove deprecated runtime warnings ([#61](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/61)) ([1e2e703](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/1e2e7038e830ef60d1f3a53e1213db3b2f9c1d31))

## [4.1.0](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v4.0.2...v4.1.0) (2023-10-21)


### Features

* Add option to disable creation of redrive policy for the dead letter queue ([#60](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/60)) ([c4db9a6](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/c4db9a6864180a8b8cce2c28ad45798bc7e2a06a))

### [4.0.2](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v4.0.1...v4.0.2) (2023-07-18)


### Bug Fixes

* Disabled adding .fifo suffix to DLQ name if use_name_prefix ([#57](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/57)) ([c08f511](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/c08f51148163affe2657d091584a66612f2bd7c1))

### [4.0.1](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v4.0.0...v4.0.1) (2023-01-19)


### Bug Fixes

* Correct `.fifo` postfix and KMS key ID usage on dead letter queue ([#51](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/51)) ([2587a70](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/2587a70ab1fc90793a9c59dadceca806f3267974))

## [4.0.0](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.5.0...v4.0.0) (2023-01-03)


### ⚠ BREAKING CHANGES

* Add support for creating an associated dead-letter queue and queue policies (#46)

### Features

* Add support for creating an associated dead-letter queue and queue policies ([#46](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/46)) ([f49fe2b](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/f49fe2b35a38ee66abc6315462ee08ebbeec9f8b))


### Bug Fixes

* Use a version for  to avoid GitHub API rate limiting on CI workflows ([#47](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/47)) ([1b622ac](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/1b622ac470836af6f4cfe4cfdea488fcb0af3440))

## [3.5.0](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.4.2...v3.5.0) (2022-11-08)


### Features

* Added wrapper module ([#43](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/43)) ([1b3915a](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/1b3915abeae4ea1455130b1c6ab21f77f3544981))

### [3.4.2](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.4.1...v3.4.2) (2022-10-27)


### Bug Fixes

* Update CI configuration files to use latest version ([#42](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/42)) ([268308a](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/268308ad53c7e95a56b4c105948acf37bc826be6))

### [3.4.1](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.4.0...v3.4.1) (2022-10-04)


### Bug Fixes

* Add conditional null for sqs_managed_sse_enabled ([#41](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/41)) ([da544b9](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/da544b9b4a16391f5a39509ba725fe63219fe0ce))

## [3.4.0](https://github.com/terraform-aws-modules/terraform-aws-sqs/compare/v3.3.0...v3.4.0) (2022-09-30)


### Features

* Adds sqs_managed_sse_enabled ([#39](https://github.com/terraform-aws-modules/terraform-aws-sqs/issues/39)) ([b1aa7e4](https://github.com/terraform-aws-modules/terraform-aws-sqs/commit/b1aa7e4aa8d79253e60949c3105cfa580daf450a))

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
