ALL_TOOLS      += celeritas
celeritas_EX_INCLUDE := /cvmfs/cms.cern.ch/el9_amd64_gcc12/external/celeritas/v0.4.1-ad666c87a65911f6744a54bf40ae468e/include
celeritas_EX_LIB := accel celeritas corecel
celeritas_EX_USE := vecgeom_interface geant4core vecgeom
celeritas_EX_FLAGS_REM_CXXFLAGS  := -Werror=missing-braces

