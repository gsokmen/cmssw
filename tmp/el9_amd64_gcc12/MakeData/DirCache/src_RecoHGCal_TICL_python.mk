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
