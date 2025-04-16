ifeq ($(strip $(RecoHGCal/TICL)),)
ALL_COMMONRULES += src_RecoHGCal_TICL_src
src_RecoHGCal_TICL_src_parent := RecoHGCal/TICL
src_RecoHGCal_TICL_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_RecoHGCal_TICL_src,src/RecoHGCal/TICL/src,LIBRARY))
RecoHGCalTICL := self/RecoHGCal/TICL
RecoHGCal/TICL := RecoHGCalTICL
RecoHGCalTICL_files := $(patsubst src/RecoHGCal/TICL/src/%,%,$(wildcard $(foreach dir,src/RecoHGCal/TICL/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
RecoHGCalTICL_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHGCal/TICL/BuildFile
RecoHGCalTICL_LOC_USE := self   DataFormats/Candidate DataFormats/HGCalReco DataFormats/VertexReco FWCore/PluginManager Geometry/HGCalCommonData PhysicsTools/TensorFlow
RecoHGCalTICL_EX_LIB   := RecoHGCalTICL
RecoHGCalTICL_EX_USE   := $(foreach d,$(RecoHGCalTICL_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHGCalTICL_PACKAGE := self/src/RecoHGCal/TICL/src
ALL_PRODS += RecoHGCalTICL
RecoHGCalTICL_CLASS := LIBRARY
RecoHGCal/TICL_forbigobj+=RecoHGCalTICL
RecoHGCalTICL_INIT_FUNC        += $$(eval $$(call Library,RecoHGCalTICL,src/RecoHGCal/TICL/src,src_RecoHGCal_TICL_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS),))
endif
