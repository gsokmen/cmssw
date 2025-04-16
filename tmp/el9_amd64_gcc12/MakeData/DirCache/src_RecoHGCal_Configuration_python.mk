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
