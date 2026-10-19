#!/bin/bash
set -e

# ==========================================
# CONFIGURATION (Change these if needed)
# ==========================================
PROJECT_ID="livetrial"
BUCKET_NAME="bakery-bucket-uncledrey007"
REGION="us-central1"

echo "=========================================="
echo "🚀 STARTING DEPLOYMENT: Document Ingestion Pipeline"
echo "=========================================="

# 1. Create the Bucket
echo "📁 Step 1: Creating Google Cloud Storage Bucket..."
gcloud storage buckets create gs://$BUCKET_NAME \
    --project=$PROJECT_ID \
    --location=$REGION

# 2. Secure the Bucket (Block Public Access)
echo "🔒 Step 2: Enforcing Public Access Prevention..."
gcloud storage buckets update gs://$BUCKET_NAME \
    --public-access-prevention

# 3. Apply the Cost-Optimization Rule
echo "💰 Step 3: Applying Cost-Optimization Lifecycle Policy..."
gcloud storage buckets update gs://$BUCKET_NAME \
    --lifecycle-file=lifecycle.json

echo "=========================================="
echo "🎉 DEPLOYMENT COMPLETE!"
echo "Your bucket 'gs://$BUCKET_NAME' is secure and cost-optimized!"
echo "=========================================="
