#pragma once

#include <cstddef>
#include <memory>

#include "llvm/Support/MemoryBuffer.h"

using namespace llvm;

struct GlobalInitializer;

std::unique_ptr<MemoryBuffer> makeMemoryBuffer(const char* bytes, size_t len);