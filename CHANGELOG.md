# CHANGELOG

<a name="unreleased"></a>
## [Unreleased]

- Fix go formatting issues ([#4](https://github.com/cloud-ca/gocca/issues/4))
- Use github actions instead of circleci ([#3](https://github.com/cloud-ca/gocca/issues/3))
- Enhance Makefile and scripts ([#2](https://github.com/cloud-ca/gocca/issues/2))
- Migrate to github.com/cloud-ca/gocca ([#1](https://github.com/cloud-ca/gocca/issues/1))


<a name="v0.4.0"></a>
## [v0.4.0] - 2019-04-15

- Add CircleCI configuration ([#23](https://github.com/cloud-ca/gocca/issues/23))
- Fixed tests after merges
- added functionality for RemoteAccessVPN and RemoteAccessVpnUser management
- Fixing casing
- Adding template support


<a name="v0.3.0"></a>
## [v0.3.0] - 2019-02-11

- Added affinity group to resources
- Added dedicated group id to instance + added affinity group list


<a name="v0.2.0"></a>
## [v0.2.0] - 2018-09-12

- Added acl name
- Added ssh keys
- Added ssh key add and delete


<a name="v0.1.0"></a>
## [v0.1.0] - 2018-04-05

- Adding missing function to interface
- Added change network
- Renamed variable msg to body in volume.go
- MC-5244: Added resize function


<a name="v0.0.2"></a>
## [v0.0.2] - 2017-05-24

- MC-5244 Fixed unit test
- Fixed error code
- Added to instance root volume size


<a name="v0.0.1"></a>
## v0.0.1 - 2017-05-24

- Renaming tiers to networks + go fmt
- Added support for more advanced Destroy operation. Also added support for additionalDisk for the instance create operation
- Added unit tests for the new fields (VpcId, VPCName) that were added to the instance api
- Added VpcId and VpcName to instance
- go fmt
- go fit
- Changed interface signatures
- Changing to use constants
- Added additional methods for LBR
- Adding stickiness method and policies
- Adding load balancer rule service
- Added available zones field
- Fixed unit tests
- Modified change compute offering to take in an object instead of a newComputeOfferingId
- Updated compute offering fields
- Fixed naming issue
- Added custom iops + size to volume and disk offering (+ removed storage tier)
- Fixed Organization API endpoint (tenants to organizations)
- Fixed Organization API endpoint (tenants to organizations)
- Update README.md
- Added missing pointer when returning API
- MC-3708: Added more unit tests and Update method
- Add support for sizeInGb
- MC-3708: Renamed acid to networkAclId
- MC-3708: First iteration of the network all rule for the go cloud.ca client
- Revert "Rename tenant to organization"
- Add DiskOfferingService to resources
- Add zones tests
- Add tests for volume operations
- MC-3707: Added network acl + test
- Add zones listing support
- Add volume operations
- Added network ACL create and delete operations
- Rename tenant to organization
- Add IpAddressId to instance model
- Update README.md
- Update README.md
- Update README.md
- Merge remote-tracking branch 'origin/master'
- Remove port range property
- Change vpcName to VpcName
- Updated field names
- Ran go fmt
- Add PortForwardingRuleService to resources
- Add tests, fix serialization issues
- Fixed tier test
- MC-3733: Added some unit tests
- MC-3733: Changed Acquire method
- MC-3742: Add port forwarding rule
- Added public ip service
- Go fmt all files
- Changed casing of tier field
- Changed redundant package name
- Update README.md
- Added change ACL operation
- Moved Required fields to top of struct
- Adapting fields to correct response
- Adding services for network acls and network offerings
- Added testing for environments
- Removing useless mocks. Adding environment_test
- Added service connection test
- Added organization unit tests
- Changed package mocks name
- Changed package for mocks
- Adding mocks and test file for environment
- Removed field from User, removed membership field from Environment
- Another fix of handling success response
- Fixed handling of success responses
- Removing commented out code
- Added VPC offering tests
- Added VPC unit tests
- Added VpcOfferingId to Vpc
- Added Vpc offering service
- Added Vpc service
- Added organization service
- Added user service
- Added service connection service
- Added update and delete
- Adding initial configuration models required by environment service
- Added cca client that accepts insecure connection
- Update README.md
- Added cloudca services mocks
- Renamed api.CcaClient to ApiClient
- Added new line at the end of errors
- Return error instead of panic if no api errors
- Update README.md
- Modified error handling section
- Added public key to instance struct
- Added volumeIdToAttach and portsToForward
- Improved examples in readme
- Fixed return value of GetResources
- Minor changes
- Added api unit tests
- Added task unit test
- Added instance unit test
- Added IpAddress field
- Added to tier service unit test
- Added volume service unit test
- Added tier service unit test
- Modified unit tests
- Added template service unit test
- Added ssh key unit test
- Added disk offering unit test
- Added compute offering tests
- Added CcaClient interface
- Update README.md
- Extracted parsing logic to separate functions
- Changed InstanceService interface from Delete to Destroy
- Added comments
- Change Delete instance to Destroy
- Update README.md
- Fixed indentation in README
- Added example to README
- Added VolumeService
- Added missing instance operations
- Added missing methods to InstanceService
- Added comments
- Added PollResponse function to task
- Added fields to tier struct and added TierService to Resources
- Added fields to template struct
- Added fields to disk offering struct
- Added fields to SSH key struct
- Added fields to compute offering struct
- Renamed NewCcaClientWithCustomURL
- Fixed some issues and removed GetName
- Change from passing by value to pointers
- Update client.go
- Implemented Get and List in entity service and instance service
- Renamed prefix CCA to Cca
- Fixed circular imports and code errors
- Fixed error in template.go
- Added Template struct
- Added List(vpcId string) method to TierService
- Fixed Get function of SSHKeyService
- Added missing ssh key name and password to instance struct
- Added ssh key struct
- Added missing entities
- Added fields to Instance struct
- Added extra methods to InstanceService
- Removed useless pointer return values (makes code simpler to understand)
- Fixed NewCCAClient function
- Renamed root package name from main to gocca
- Added missing task status
- Added entity service to InstanceService
- Added TaskId and TaskStatus to CCAResponse and added DEFAULT_API_URL
- Improved api interaction logic
- Added comments for Go docs
- Delete go-cloudca
- Create LICENSE
- Implemented TaskApi
- Added initial request framework
- Added client.go
- Initial commit


[Unreleased]: https://github.com/cloud-ca/gocca/compare/v0.4.0...HEAD
[v0.4.0]: https://github.com/cloud-ca/gocca/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/cloud-ca/gocca/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/cloud-ca/gocca/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/cloud-ca/gocca/compare/v0.0.2...v0.1.0
[v0.0.2]: https://github.com/cloud-ca/gocca/compare/v0.0.1...v0.0.2
