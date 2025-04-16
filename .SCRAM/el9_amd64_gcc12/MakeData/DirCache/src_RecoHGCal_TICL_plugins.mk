ifeq ($(strip $(RecoHGCalTICLPlugins)),)
RecoHGCalTICLPlugins := self/src/RecoHGCal/TICL/plugins
PLUGINS:=yes
RecoHGCalTICLPlugins_files := $(patsubst src/RecoHGCal/TICL/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoHGCal/TICL/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHGCal/TICL/plugins/$(file). Please fix src/RecoHGCal/TICL/plugins/BuildFile.))))
RecoHGCalTICLPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHGCal/TICL/plugins/BuildFile
RecoHGCalTICLPlugins_LOC_FLAGS_USE_SOURCE_ONLY   := Geometry/CommonDetUnit
RecoHGCalTICLPlugins_LOC_USE := self   CommonTools/Utils DataFormats/CaloRecHit DataFormats/Common DataFormats/GeometrySurface DataFormats/GsfTrackReco DataFormats/HGCalReco DataFormats/L1TCorrelator DataFormats/Math DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco DataFormats/TrackReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/ServiceRegistry FWCore/Utilities Geometry/CaloGeometry Geometry/HGCalCommonData Geometry/Records MagneticField/Engine MagneticField/Records PhysicsTools/TensorFlow PhysicsTools/UtilAlgos PhysicsTools/ONNXRuntime RecoEcal/EgammaCoreTools RecoLocalCalo/HGCalRecAlgos RecoLocalCalo/HGCalRecProducers RecoHGCal/TICL RecoParticleFlow/PFProducer SimDataFormats/Associations SimDataFormats/CaloAnalysis TrackingTools/GeomPropagators TrackingTools/Records TrackingTools/TrajectoryState fastjet
RecoHGCalTICLPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHGCalTICLPlugins,RecoHGCalTICLPlugins,$(SCRAMSTORENAME_LIB),src/RecoHGCal/TICL/plugins))
RecoHGCalTICLPlugins_PACKAGE := self/src/RecoHGCal/TICL/plugins
ALL_PRODS += RecoHGCalTICLPlugins
RecoHGCal/TICL_forbigobj+=RecoHGCalTICLPlugins
RecoHGCalTICLPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoHGCalTICLPlugins,src/RecoHGCal/TICL/plugins,src_RecoHGCal_TICL_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
RecoHGCalTICLPlugins_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,RecoHGCalTICLPlugins,src/RecoHGCal/TICL/plugins))
endif
ALL_COMMONRULES += src_RecoHGCal_TICL_plugins
src_RecoHGCal_TICL_plugins_parent := RecoHGCal/TICL
src_RecoHGCal_TICL_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHGCal_TICL_plugins,src/RecoHGCal/TICL/plugins,PLUGINS))
