ALL_SUBSYSTEMS+=RecoHGCal
subdirs_src_RecoHGCal = src_RecoHGCal_Configuration src_RecoHGCal_TICL
subdirs_src += src_RecoHGCal
ALL_PACKAGES += RecoHGCal/Configuration
subdirs_src_RecoHGCal_Configuration := src_RecoHGCal_Configuration_python
ifeq ($(strip $(PyRecoHGCalConfiguration)),)
PyRecoHGCalConfiguration := self/src/RecoHGCal/Configuration/python
src_RecoHGCal_Configuration_python_parent := src/RecoHGCal/Configuration
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHGCal/Configuration/python)
PyRecoHGCalConfiguration_files := $(patsubst src/RecoHGCal/Configuration/python/%,%,$(wildcard $(foreach dir,src/RecoHGCal/Configuration/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHGCalConfiguration_LOC_USE := self   
PyRecoHGCalConfiguration_PACKAGE := self/src/RecoHGCal/Configuration/python
ALL_PRODS += PyRecoHGCalConfiguration
PyRecoHGCalConfiguration_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHGCalConfiguration,src/RecoHGCal/Configuration/python,src_RecoHGCal_Configuration_python))
else
$(eval $(call MultipleWarningMsg,PyRecoHGCalConfiguration,src/RecoHGCal/Configuration/python))
endif
ALL_COMMONRULES += src_RecoHGCal_Configuration_python
src_RecoHGCal_Configuration_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHGCal_Configuration_python,src/RecoHGCal/Configuration/python,PYTHON))
ALL_PACKAGES += RecoHGCal/TICL
subdirs_src_RecoHGCal_TICL := src_RecoHGCal_TICL_plugins src_RecoHGCal_TICL_python src_RecoHGCal_TICL_src src_RecoHGCal_TICL_test
ifeq ($(strip $(PyRecoHGCalTICL)),)
PyRecoHGCalTICL := self/src/RecoHGCal/TICL/python
src_RecoHGCal_TICL_python_parent := src/RecoHGCal/TICL
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHGCal/TICL/python)
PyRecoHGCalTICL_files := $(patsubst src/RecoHGCal/TICL/python/%,%,$(wildcard $(foreach dir,src/RecoHGCal/TICL/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHGCalTICL_LOC_USE := self   
PyRecoHGCalTICL_PACKAGE := self/src/RecoHGCal/TICL/python
ALL_PRODS += PyRecoHGCalTICL
PyRecoHGCalTICL_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHGCalTICL,src/RecoHGCal/TICL/python,src_RecoHGCal_TICL_python))
else
$(eval $(call MultipleWarningMsg,PyRecoHGCalTICL,src/RecoHGCal/TICL/python))
endif
ALL_COMMONRULES += src_RecoHGCal_TICL_python
src_RecoHGCal_TICL_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHGCal_TICL_python,src/RecoHGCal/TICL/python,PYTHON))
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
