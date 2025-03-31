#!/bin/bash

QDRANT_URL="http://localhost:6333" \
COLLECTION_NAME="mcp-server-qdrant-knowledge-base" \
TOOL_STORE_DESCRIPTION="Store reusable mcp-server-qdrant-knowledge-base for later retrieval. \
The 'information' parameter should contain a natural language description of what the code does, \
while the actual code should be included in the 'metadata' parameter as a 'code' property. \
The value of 'metadata' is a Python dictionary with strings as keys. \
Use this whenever you generate some code snippet." \
TOOL_FIND_DESCRIPTION="Search for relevant mcp-server-qdrant-knowledge-base based on natural language descriptions. \
The 'query' parameter should describe what you're looking for, \
and the tool will return the most relevant mcp-server-qdrant-knowledge-base. \
Use this when you need to find existing mcp-server-qdrant-knowledge-base for reuse or reference." \
uvx mcp-server-qdrant --transport sse # Enable SSE transport