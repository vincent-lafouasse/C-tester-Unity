add_library(unity)

target_include_directories(unity PUBLIC include)
target_include_directories(unity PUBLIC src)
target_sources(unity
PRIVATE
    src/unity.c
    src/unity_fixture.c
    src/unity_memory.c
)
target_compile_options(unity PRIVATE -DUNITY_SUPPORT_64 -DUNITY_OUTPUT_COLOR)
