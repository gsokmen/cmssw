ALL_TOOLS      += rocm
rocm_EX_INCLUDE := /cvmfs/cms.cern.ch/el9_amd64_gcc12/external/rocm/5.6.1-aa237aa7bbff68db0edb0f7b777b5194/include
rocm_EX_LIB := amdhip64 hsa-runtime64 rocm_smi64
rocm_EX_FLAGS_CPPDEFINES  := -D__HIP_PLATFORM_HCC__ -D__HIP_PLATFORM_AMD__
rocm_EX_FLAGS_ROCM_FLAGS  := --offload-arch=gfx900 --offload-arch=gfx90a --offload-arch=gfx1100 --offload-arch=gfx1102 -fgpu-rdc --target=x86_64-redhat-linux-gnu --gcc-toolchain=$(COMPILER_PATH)
rocm_EX_FLAGS_SYSTEM_INCLUDE  := 1

