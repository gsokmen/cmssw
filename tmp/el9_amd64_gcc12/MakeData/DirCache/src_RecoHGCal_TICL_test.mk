ifeq ($(strip $(testRecoHGCalTICL)),)
testRecoHGCalTICL := self/src/RecoHGCal/TICL/test
testRecoHGCalTICL_files := $(patsubst src/RecoHGCal/TICL/test/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoHGCal/TICL/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHGCal/TICL/test/$(file). Please fix src/RecoHGCal/TICL/test/BuildFile.))))
testRecoHGCalTICL_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHGCal/TICL/test/BuildFile
testRecoHGCalTICL_LOC_USE := self   FWCore/Framework FWCore/ParameterSet DataFormats/HGCalReco DataFormats/TrackReco DataFormats/Math SimDataFormats/CaloAnalysis RecoLocalCalo/HGCalRecAlgos
testRecoHGCalTICL_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,testRecoHGCalTICL,testRecoHGCalTICL,$(SCRAMSTORENAME_LIB),src/RecoHGCal/TICL/test))
testRecoHGCalTICL_PACKAGE := self/src/RecoHGCal/TICL/test
ALL_PRODS += testRecoHGCalTICL
testRecoHGCalTICL_INIT_FUNC        += $$(eval $$(call Library,testRecoHGCalTICL,src/RecoHGCal/TICL/test,src_RecoHGCal_TICL_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),edm))
testRecoHGCalTICL_CLASS := TEST_LIBRARY
else
$(eval $(call MultipleWarningMsg,testRecoHGCalTICL,src/RecoHGCal/TICL/test))
endif
ALL_COMMONRULES += src_RecoHGCal_TICL_test
src_RecoHGCal_TICL_test_parent := RecoHGCal/TICL
src_RecoHGCal_TICL_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHGCal_TICL_test,src/RecoHGCal/TICL/test,TEST))
