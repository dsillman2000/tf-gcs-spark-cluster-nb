#!/bin/bash

# Change this to your project ID
export TF_VAR_gcp_project_id="gcp-spark-451716"

# Check that gcloud is installed
if ! command -v gcloud &> /dev/null
then
    echo "gcloud could not be found. Please install Google Cloud SDK."
    exit
fi

# Check that gcloud is authenticated
if ! gcloud auth list --format="value(account)" | grep -q '@'; then
    echo "You are not authenticated. Please run 'gcloud auth login'."
    exit
else 
    # Get the active account
    ACTIVE_ACCOUNT=$(gcloud auth list --filter="status:ACTIVE" --format="value(account)")
    echo "Active account: $ACTIVE_ACCOUNT"
fi

# Check that we have an open billing account
if ! gcloud billing accounts list --filter="open=true" --uri | head -1 | grep -q 'billingAccounts/'; then
    echo "You do not have an open billing account. Please create one."
    exit
else
    # Get the billing account ID
    BILLING_ACCOUNT_ID=$(gcloud billing accounts list --filter="open=true" --format="value(name)" | head -1 | cut -d'/' -f2)
    echo "Billing account ID: $BILLING_ACCOUNT_ID"
fi

# Export the billing account ID as an environment variable
export TF_VAR_gcp_billing_account_id=$BILLING_ACCOUNT_ID
echo "Exported billing account ID as TF_VAR_gcp_billing_account_id"

gcloud auth application-default set-quota-project $TF_VAR_gcp_project_id
echo "Set quota project to $TF_VAR_gcp_project_id"
gcloud config set project $TF_VAR_gcp_project_id
echo "Set gcloud project to $TF_VAR_gcp_project_id"

# Check service account exists
if ! gcloud iam service-accounts list --format="value(email)" | grep -q '@'; then
    echo "Service account does not exist. Creating one..."
    # Create a service account
    gcloud iam service-accounts create $TF_VAR_gcp_project_id \
        --description="Terraform service account for $TF_VAR_gcp_project_id" \
        --display-name="tf-service" \
        --project=$TF_VAR_gcp_project_id
fi

# Get the service account email
SERVICE_ACCOUNT_EMAIL=$(gcloud iam service-accounts list --format="value(email)" | head -1)
echo "Service account email: $SERVICE_ACCOUNT_EMAIL"

# Enable the dataproc service API
gcloud services enable dataproc.googleapis.com \
    --project=$TF_VAR_gcp_project_id
echo "Enabled Dataproc API"

# Grant the service account some necessary permissions
# storage.admin
gcloud projects add-iam-policy-binding $TF_VAR_gcp_project_id \
    --member="serviceAccount:$SERVICE_ACCOUNT_EMAIL" \
    --role="roles/storage.admin"
echo "Granted storage.admin role to service account"

export GOOGLE_CREDENTIALS=$(gcloud iam service-accounts keys create /dev/stdout \
    --iam-account=$SERVICE_ACCOUNT_EMAIL \
    --project=$TF_VAR_gcp_project_id \
    --key-file-type=json)
echo "Exported service account credentials as GOOGLE_CREDENTIALS"$'\n\n'
echo "Service account credentials exported. You can now use them in your Terraform configuration."
echo "You can now run 'terraform init' and 'terraform apply' to create the resources."
