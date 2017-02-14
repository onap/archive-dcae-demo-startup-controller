This project hosts the configurations and start-up scripts for instantiating the Open eCOMP DCAE Controller

To deploy an Open eCOMP DCAE Controller to a host:

Prepare the docker host VM, by installing:  git, docker, docker-compose. Then run the following commands with variables substituted as require.


	apt-get install -y make
	cd /opt
	git clone https://__gitlab_username__:__gitlab_password__@gitlab/dcae-startup/dcae-startup-vm-controller.git
	cd /opt/dcae-startup-vm-controller
	mkdir -p /opt/app/dcae-controller
	cat > /opt/app/dcae-controller/config.yaml << EOF_CONFIG
	DCAE-VERSION: __dcae_version__
	ZONE: __dcae_zone__
	STATE: __dcae_state__
	HORIZON-URL: https://mycloud.rackspace.com/cloud/__tenant_id__
	KEYSONE-URL: https://identity.api.rackspacecloud.com/v2.0
	OPENSTACK-TENANT-ID: __tenant_id__
	OPENSTACK-TENANT-NAME: OPEN-ECOMP
	OPENSTACK-REGION: __openstack_region__
	OPENSTACK-PRIVATE-NETWORK: __openstack_private_network_name__
	OPENSTACK-USER: __openstack_user__
	OPENSTACK-PASSWORD: __openstack_password__
	OPENSTACK-KEYNAME: __key_name__
	OPENSTACK-PUBKEY: __pub_key__
	
	NEXUS-URL-ROOT: __nexus_repo_root__
	NEXUS-USER: __nexus_username__
	NEXUS-PASSWORD: __nexus_password__
	
	MR-REPO: __mr_repo___
	EOF_CONFIG
	bash init.sh
	make up

# Dependencies 

## DCAE Controller Docker Image

	ecomp-nexus:51212/dcae-controller:1.0.0

## CDAP VMs

### Maven artifacts

	org.openecomp.dcae.controller:dcae-controller-service-cdap-cluster-manager:1.0.0:zip:runtime
	org.openecomp.dcae.controller:dcae-controller-service-dmaap-drsub:1.0.0:zip:runtime
	org.openecomp.dcae.controller:dcae-controller-service-dmaap-drsub-manager:1.0.0:zip:runtime

### Maven RAW files

	raw/org.openecomp.dcae/zip-snapshots/dcae-controller-core-utils-1.0.0-runtime.zip
	raw/org.openecomp.dcae/deb-snapshots/org.openecomp.dcae.controller/dcae-cdap-small-hadoop_1.0.0-LATEST.deb
	raw/org.openecomp.dcae/deb-snapshots/org.openecomp.dcae.controller/dcae-analytics-tca_1.0.0-LATEST.deb
	raw/org.openecomp.dcae/deb-snapshots/org.openecomp.dcae.controller/dcae-analytics-cdap-helloworld_1.0.0-LATEST.deb
	
## DOCKER HOST VM

### Maven artifacts

	org.openecomp.dcae.controller:dcae-controller-service-docker-host-manager:1.0.0:zip:runtime
	org.openecomp.dcae.controller:dcae-controller-service-docker-model:1.0.0:jar
	org.openecomp.dcae.controller:dcae-controller-service-docker-adaptor:1.0.0:jar
	org.openecomp.dcae.controller:dcae-controller-service-standardeventcollector-model:1.0.0:jar
	org.openecomp.dcae.controller:dcae-controller-service-standardeventcollector-manager:1.0.0:jar
	
### Maven RAW files

	raw/org.openecomp.dcae/zip-snapshots/dcae-controller-core-utils-1.0.0-runtime.zip

### Docker Images
	
	ecomp-nexus:51212/dcae_dmaapbc:1.0.0
	ecomp-nexus:51212/dcae-controller-common-event:1.0.0

## POSTGRES VM

### Maven artifacts

	org.openecomp.dcae.controller:dcae-controller-service-common-vm-manager:1.0.0:zip:runtime
	org.openecomp.dcae.controller:dcae-controller-service-storage-postgres-model:1.0.0:jar

### Maven RAW files

	raw/org.openecomp.dcae/zip-snapshots/dcae-controller-core-utils-1.0.0-runtime.zip
	raw/org.openecomp.dcae/deb-snapshots/org.openecomp.dcae.storage.pgaas/cdf_1.0.0-LATEST.deb
	raw/org.openecomp.dcae/deb-snapshots/org.openecomp.dcae.storage.pgaas/postgresql-prep_1.0.0-LATEST.deb
	raw/org.openecomp.dcae/deb-snapshots/org.openecomp.dcae.storage.pgaas/postgresql-config_1.0.0-LATEST.deb
	raw/org.openecomp.dcae/deb-snapshots/org.openecomp.dcae.storage.pgaas/pgaas_1.0.0-LATEST.deb
	raw/org.openecomp.dcae/deb-snapshots/org.openecomp.dcae.storage.pgaas/pgaas-post_1.0.0-LATEST.deb

