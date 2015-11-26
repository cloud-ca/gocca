package services/cloudca

type DiskOffering struct {

}

type DiskOfferingService interface {
	Get(id string) (DiskOffering, error)
	GetByName(name string) (DiskOffering, error)
	List() ([]DiskOffering, error)
}

type DiskOfferingApi struct {
	entityService EntityService
}

func NewInstanceService(apiClient CCAApiClient, serviceCode string, environmentName string) DiskOfferingService {
	return DiskOfferingApi{
		"entityService": NewEntityService(apiClient, serviceCode, environmentName, DISK_OFFERING_ENTITY_TYPE)
	}
}

func (diskOfferingAPi DiskOfferingApi) Get(id string) (DiskOffering, error) {
	return DiskOffering{}, nil
}

func (diskOfferingAPi DiskOfferingApi) GetByName(name string) (DiskOffering, error) {
	return DiskOffering{}, nil
}

func (diskOfferingAPi DiskOfferingApi) List() ([]DiskOffering, error) {
	return []DiskOffering{}, nil
}
