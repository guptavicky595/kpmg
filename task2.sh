#!/bin/bash
echo "Please connect to the GCP VM Machine & then execure this file"
echo "Google VM metadata"
curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/?recursive=true" -H "Metadata-Flavor: Google"
